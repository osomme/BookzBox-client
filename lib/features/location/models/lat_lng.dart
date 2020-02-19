import 'package:flutter/material.dart';

/// Model class representing the latitudinal and longitudinal coordinates on a map.
class LatLng {
  final double latitude;
  final double longitude;

  LatLng({
    @required this.latitude,
    @required this.longitude,
  });
}
