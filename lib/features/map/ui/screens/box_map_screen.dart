import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:bookzbox/common/di/providers.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:bookzbox/features/map/box_map.dart';
import 'package:dartz/dartz.dart' as Dartz;
import 'package:bookzbox/features/location/models/lat_lng.dart' as LatLngModel;
import 'package:flutter/material.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class BoxMapScreen extends StatefulWidget {
  final MapStore mapStore;

  const BoxMapScreen({
    Key key,
    this.mapStore,
  }) : super(key: key);

  @override
  _BoxMapScreenState createState() => _BoxMapScreenState();
}

class _BoxMapScreenState extends State<BoxMapScreen> {
  List<ReactionDisposer> listeners = List();

  // Default camera pos. (Halden, Norway)
  final startPos = const LatLng(59.1303617, 11.3543517);

  List<ClusterItem<BoxMapItem>> items = List();

  ClusterManager manager;

  Set<Marker> markers = Set();

  GoogleMapController mapController;

  static const double _startingZoom = 12.0;

  @override
  void initState() {
    manager = _initClusterManager();
    super.initState();
  }

  ClusterManager<BoxMapItem> _initClusterManager() {
    return ClusterManager<BoxMapItem>(items, _updateMarkers,
        initialZoom: _startingZoom,
        markerBuilder: _markerBuilder,
        levels: const [5, 8.25, 11.5, 14.5, 16, 16.5, 20]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    listeners.addAll([
      _boxesListener(),
      _errorListener(),
    ]);
  }

  @override
  void dispose() {
    listeners.forEach((listener) => listener());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          minMaxZoomPreference: MinMaxZoomPreference(5.0, 15.0),
          mapToolbarEnabled: false,
          markers: markers,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: startPos,
            zoom: _startingZoom,
          ),
          onCameraIdle: manager.updateMap,
          onCameraMove: _onCameraMoved,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
        ),
      ),
    );
  }

  void _onCameraMoved(CameraPosition camPos) {
    manager.onCameraMove(camPos);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    manager.setMapController(controller);
    listeners.add(_userLocationListener());
  }

  ReactionDisposer _errorListener() {
    return autorun((_) {
      if (widget.mapStore.error != null) {
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(widget.mapStore.error.toErrorString(context))),
        );
      }
    });
  }

  ReactionDisposer _userLocationListener() =>
      autorun((_) => _onUserLocationObtained(widget.mapStore.userPosition));

  ReactionDisposer _boxesListener() =>
      autorun((_) => _onBoxesLoaded(widget.mapStore.boxes));

  Future<void> _onUserLocationObtained(
      Dartz.Option<LatLngModel.LatLng> userLocation) async {
    final currentUserPos = userLocation
        .map((p) => LatLng(p.latitude, p.longitude))
        .getOrElse(() => startPos);
    await mapController.moveCamera(CameraUpdate.newLatLng(currentUserPos));
  }

  Future<void> _onBoxesLoaded(List<BoxMapItem> boxes) async {
    final items =
        boxes.map((b) => ClusterItem(LatLng(b.latitude, b.longitude), item: b)).toList();
    manager.setItems(items);
  }

  void buildDetailsWidget(BoxMapItem box) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        child: SingleChildScrollView(
          child: MultiProvider(
            providers: boxLikeProviders,
            child: Consumer<IBoxLikeRepository>(
              builder: (_, likeRepo, __) => ModalBoxDetails(
                box: box,
                likeStore: BoxLikeStore(
                  likeRepo,
                  Provider.of<IAuthService>(context),
                  box.boxId,
                ),
                authStore: Provider.of<AuthStore>(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _updateMarkers(Set<Marker> markers) => setState(() => this.markers = markers);

  // Taken from the example code for the google_maps_cluster_manager library:
  // https://github.com/bpillon/google_maps_cluster_manager
  Future<Marker> Function(Cluster<BoxMapItem>) get _markerBuilder => (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            print('Clicked on cluster with size: ${cluster.items.length}');
            cluster.items.forEach((b) => print('${b.boxId}'));
          },
          icon: await _getMarkerBitmap(cluster.isMultiple ? 125 : 75,
              text: cluster.isMultiple ? cluster.count.toString() : null),
        );
      };

  // Taken from the example code for the google_maps_cluster_manager library:
  // https://github.com/bpillon/google_maps_cluster_manager
  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String text}) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = Theme.of(context).primaryColor;
    final Paint paint2 = Paint()..color = Theme.of(context).accentColor;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
          fontSize: size / 3,
          color: Theme.of(context).primaryTextTheme.body1.color,
          fontWeight: FontWeight.normal,
        ),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }
}
