import 'package:bookzbox/features/map/box_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

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

  // Default camera pos. (Halden)
  final startPos = LatLng(59.1303617, 11.3543517);

  Set<Marker> markers = Set();

  GoogleMapController mapController;

  LatLng currentCamPos;

  int iconSize = 84;

  int oldIconSize = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    listeners.add(errorListener());
  }

  @override
  void dispose() {
    listeners.forEach((listener) => listener());
    super.dispose();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    listeners.addAll([boxesListener(), userLocationListener()]);
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

  ReactionDisposer userLocationListener() {
    return autorun((_) async {
      await mapController.moveCamera(
        CameraUpdate.newLatLng(widget.mapStore.userPosition
            .map((p) => LatLng(p.latitude, p.longitude))
            .getOrElse(() => startPos)),
      );
    });
  }

  ReactionDisposer boxesListener() {
    return autorun((_) async {
      final markerIcon = await loadIcon();
      setState(() {
        markers = widget.mapStore.boxes.map((b) {
          return Marker(
            markerId: MarkerId(b.boxId),
            position: LatLng(b.latitude, b.longitude),
            onTap: () => buildDetailsWidget(b),
            icon: markerIcon,
          );
        }).toSet();
      });
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
        child: Container(
          child: SingleChildScrollView(
            child: ModalBoxDetails(box: box),
          ),
          height: MediaQuery.of(context).size.height * 0.75,
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
