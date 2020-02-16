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
  GoogleMapController _mapController;

  void _onMapCreated(GoogleMapController controller) => _mapController = controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
