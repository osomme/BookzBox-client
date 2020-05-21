import 'package:bookzbox/common/extensions/double_extensions.dart';

class Location {
  /// Get the coordinate with ~250m accuracy radius.
  /// When using this function for both a latitude and a longitude coordinate,
  /// then the new point will have an accuracy of 250-500m depending on the
  /// start location. It will be on the lower end when closing on the
  /// poles and on the higher end when closing on the equator.
  ///
  /// [coord] The latitude or longitude coordinate to convert
  ///         from an exact location to within 250m of the given point.
  ///
  /// Note: The goal of this function is only to make a coordinate less accurate.
  ///       If one only has access to the updated coordinate value, then one can only
  ///       know that the original point was within a ~250m radius of the new point.
  ///       This is true even if the original point and the new point are only 50m apart.
  static double getCoordAt250mAccuracy(double coord) {
    return ((coord * 2.0) + 0.005).roundDown(0.01) / 2.0;
  }
}
