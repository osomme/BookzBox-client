import 'package:flutter/material.dart';

/// Model class representing the latitudinal and longitudinal coordinates on a map.
class LatLng {
  /// The latitudinal coordinate of the point.
  final double latitude;

  /// The longitudinal coordinate of the point.
  final double longitude;

  LatLng({
    @required this.latitude,
    @required this.longitude,
  });

  @override
  String toString() => '[LatLng] latitude: $latitude, longitude: $longitude';
}
