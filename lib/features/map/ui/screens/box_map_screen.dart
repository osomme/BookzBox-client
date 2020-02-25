import 'package:bookzbox/common/di/providers.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/feed/stores/box_like_store.dart';
import 'package:bookzbox/features/map/box_map.dart';
import 'package:dartz/dartz.dart' as Dartz;
import 'package:bookzbox/features/location/models/lat_lng.dart' as LatLngModel;
import 'package:flutter/material.dart';
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

  Set<Marker> markers = Set();

  GoogleMapController mapController;

  LatLng currentCamPos;

  int iconSize = 84;

  int oldIconSize = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    listeners.addAll([
      boxesListener(),
      errorListener(),
    ]);
  }

  @override
  void dispose() {
    listeners.forEach((listener) => listener());
    super.dispose();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    listeners.add(userLocationListener());
    reloadMarkers();
  }

  ReactionDisposer errorListener() {
    return autorun((_) {
      if (widget.mapStore.error != null) {
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(widget.mapStore.error.toErrorString(context))),
        );
      }
    });
  }

  ReactionDisposer userLocationListener() =>
      autorun((_) => onUserLocationObtained(widget.mapStore.userPosition));

  ReactionDisposer boxesListener() =>
      autorun((_) => onBoxesLoaded(widget.mapStore.boxes));

  Future<void> onUserLocationObtained(
      Dartz.Option<LatLngModel.LatLng> userLocation) async {
    await mapController.moveCamera(CameraUpdate.newLatLng(userLocation
        .map((p) => LatLng(p.latitude, p.longitude))
        .getOrElse(() => startPos)));
  }

  Future<void> onBoxesLoaded(List<BoxMapItem> boxes) async {
    final markerIcon = await loadIcon();
    setState(() {
      markers = boxes.map((b) {
        return Marker(
          markerId: MarkerId(b.boxId),
          position: LatLng(b.latitude, b.longitude),
          onTap: () => buildDetailsWidget(b),
          icon: markerIcon,
        );
      }).toSet();
    });
  }

  void reloadMarkers() async {
    if (iconSize == oldIconSize) {
      // If icon size is the same as last time icons were updated, do not re-render them again, to save performance.
      return;
    }

    final markerIcon = await loadIcon();
    oldIconSize = iconSize;

    print('Creating new markers with icon size: $iconSize');
    setState(() {
      markers = markers.map((m) => m.copyWith(iconParam: markerIcon)).toSet();
    });
  }

  Future<BitmapDescriptor> loadIcon() async {
    return await AssetLoader.getBytesFromAsset('assets/images/box-map-icon.png', iconSize)
        .then((b) => BitmapDescriptor.fromBytes(b));
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onCameraIdle() => reloadMarkers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: markers,
        onMapCreated: onMapCreated,
        initialCameraPosition: CameraPosition(
          target: startPos,
          zoom: 12.0,
        ),
        onCameraIdle: onCameraIdle,
        onCameraMove: (camPos) {
          currentCamPos = camPos.target;
          iconSize = camPos.zoom.round() * 7;
        },
        myLocationButtonEnabled: false,
      ),
    );
  }
}
