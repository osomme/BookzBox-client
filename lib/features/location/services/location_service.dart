import 'package:bookzbox/features/location/location.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

/// Provides various methods for location based services.
abstract class ILocationService {
  /// Retrives location information from latitude and longitude coordinates.
  ///
  /// [lat] The latitudinal coordinate.
  /// [lng] The longitudinal coordinate.
  Future<Option<Placemark>> getLocationDataFrom(double lat, double lng);

  /// Retrieves the rough location of the current device.
  Future<Either<String, LatLng>> getLocation();
}
