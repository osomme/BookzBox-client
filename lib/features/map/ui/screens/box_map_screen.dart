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
  final LatLng _center = const LatLng(45.521563, -122.677433);

  final Map<String, Marker> _markers = {};

  GoogleMapController _mapController;

  void _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;

    final markerIcon =
        await AssetLoader.getBytesFromAsset('assets/images/box-map-icon.png', 125)
            .then((b) => BitmapDescriptor.fromBytes(b));

    setState(() {
      _markers['m1'] = Marker(
        markerId: MarkerId('1'),
        position: _center,
        onTap: () => print('Tapped marker 1'),
        icon: markerIcon,
      );

      _markers['m2'] = Marker(
        markerId: MarkerId('2'),
        position: _center,
        onTap: () => print('Tapped marker 2'),
        icon: markerIcon,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: _markers.values.toSet(),
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
