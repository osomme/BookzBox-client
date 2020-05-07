import 'dart:async';
import 'dart:ui';

import 'package:bookzbox/common/di/providers.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:bookzbox/features/map/box_map.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:dartz/dartz.dart' as Dartz;
import 'package:bookzbox/features/location/models/lat_lng.dart' as LatLngModel;
import 'package:flutter/material.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return ClusterManager<BoxMapItem>(
      items,
      _updateMarkers,
      initialZoom: _startingZoom,
      markerBuilder: _markerBuilder,
    );
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

  // TODO: Remove. This is just a demo implementation for focus group.
  Future<void> _launchURL() async {
    const url = 'https://ark.no';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
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
              minMaxZoomPreference: MinMaxZoomPreference(5.0, 15.0),
              mapToolbarEnabled: false,
            ),
            Positioned.directional(
              textDirection: TextDirection.ltr,
              bottom: 15,
              start: 15,
              child: Row(
                children: <Widget>[
                  FloatingActionButton.extended(
                    onPressed: _openFilterDialog,
                    label: Text(
                      S.of(context).mapFilterButtonLabel,
                      style: Theme.of(context)
                          .accentTextTheme
                          .button
                          .copyWith(fontSize: 13.0),
                    ),
                    icon: widget.mapStore.hasActiveFilter
                        ? Icon(
                            Icons.check_circle,
                            size: 18.0,
                          )
                        : Icon(
                            Icons.filter_list,
                            size: 18.0,
                          ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async => _launchURL(),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 224,
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: Colors.black,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/reklame_banner.png',
                        fit: BoxFit.fill,
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.black45,
                        ),
                        child: Text(
                          'Ad',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
          onTap: () => _onClusterClicked(cluster),
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

  void _onClusterClicked(Cluster<BoxMapItem> cluster) {
    // Show the map box details dialog if there is only one box in the cluster.
    if (cluster.items.length == 1) {
      buildDetailsWidget(cluster.items.first);
    } else {
      // Sort the boxes in the cluster. Most recently published box first.
      final sorted = cluster.items.toList()
        ..sort((b1, b2) => b2.publishedOn.compareTo(b1.publishedOn));
      // Show bottom sheet list if there are more than one box in the cluster.
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (ctx) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
            ),
          ),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.75,
          ),
          child: MapBoxList(boxes: sorted),
        ),
      );
    }
  }

  void _openFilterDialog() async {
    final filters = await showModalBottomSheet<BoxFilterValues>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.90,
          ),
          child: Container(
            margin: EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.all(const Radius.circular(25.0)),
            ),
            child: BoxFilter(
              currentFilter: widget.mapStore.filters,
            ),
          ),
        ),
      ),
    );
    if (filters != null) {
      widget.mapStore.setBoxFilter(filters);
    }
  }
}
