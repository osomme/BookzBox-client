import 'package:bookzbox/features/home_screen/helpers/asset_loader.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BoxMapScreen extends StatefulWidget {
  BoxMapScreen._privConstructor();

  static final instance = BoxMapScreen._privConstructor();

  @override
  _BoxMapScreenState createState() => _BoxMapScreenState();
}

class _BoxMapScreenState extends State<BoxMapScreen> {
  final locations = [LatLng(45.521563, -122.677433), LatLng(45.521563, -122.70)];

  final Map<String, Marker> markers = {};

  GoogleMapController mapController;

  LatLng currentCamPos;

  int iconSize = 50;

  int oldIconSize = 0;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    reloadMarkers();
  }

  void reloadMarkers() async {
    if (iconSize == oldIconSize) {
      // If icon size is the same as last time icons were updated, do not re-render them again, to save performance.
      return;
    }

    final markerIcon =
        await AssetLoader.getBytesFromAsset('assets/images/box-map-icon.png', iconSize)
            .then((b) => BitmapDescriptor.fromBytes(b));

    oldIconSize = iconSize;

    print('Creating new markers with icon size: $iconSize');
    setState(() {
      markers['m1'] = Marker(
        markerId: MarkerId('1'),
        position: locations.first,
        onTap: () => print('Tapped marker 1'),
        icon: markerIcon,
      );

      markers['m2'] = Marker(
        markerId: MarkerId('2'),
        position: locations.last,
        onTap: () => print('Tapped marker 2'),
        icon: markerIcon,
      );
    });
  }

  void _onCameraIdle() => reloadMarkers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: markers.values.toSet(),
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: locations.first,
          zoom: 11.0,
        ),
        onCameraIdle: _onCameraIdle,
        onCameraMove: (camPos) {
          currentCamPos = camPos.target;
          iconSize = camPos.zoom.round() * 7;
        },
        myLocationButtonEnabled: false,
      ),
    );
  }
}
