import 'package:bookzbox/features/location/services/location_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

/// Provides various methods for location based services.
class LocationService implements ILocationService {
  /// Retrives location information from latitude and longitude coordinates.
  @override
  Future<Option<Placemark>> getLocationDataFrom(double lat, double lng) async {
    try {
      final results = await Geolocator().placemarkFromCoordinates(lat, lng);
      if (results == null || results.isEmpty) {
        return none();
      }
      return some(results.first);
    } on PlatformException catch (e) {
      print(e);
      return none();
    }
  }
}
