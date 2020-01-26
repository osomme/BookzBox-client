import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

/// Provides various methods for location based services.
abstract class ILocationService {
  /// Retrives location information from latitude and longitude coordinates.
  Future<Option<Placemark>> getLocationDataFrom(double lat, double lng);
}
