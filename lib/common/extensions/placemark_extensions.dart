import 'package:geolocator/geolocator.dart';

extension PlacemarkExtensions on Placemark {
  String toLocationString() {
    if (this.subLocality.isNotEmpty) {
      return this.subLocality;
    } else if (this.locality.isNotEmpty) {
      return this.locality;
    } else if (this.subAdministrativeArea.isNotEmpty) {
      return this.subAdministrativeArea;
    } else if (this.administrativeArea.isNotEmpty) {
      return this.administrativeArea;
    } else if (this.country.isNotEmpty) {
      return this.country;
    } else {
      return this.name;
    }
  }
}
