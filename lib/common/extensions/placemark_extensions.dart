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

  String toExtendedLocationString() {
    final results = List<String>();
    if (this.subLocality.isNotEmpty) {
      results.add(this.subLocality);
    }
    if (this.locality.isNotEmpty) {
      results.add(this.locality);
    }
    if (this.subAdministrativeArea.isNotEmpty) {
      results.add(this.subAdministrativeArea);
    }
    if (this.administrativeArea.isNotEmpty) {
      results.add(this.administrativeArea);
    }
    if (this.country.isNotEmpty) {
      results.add(this.country);
    }
    return results.where((s) => s != null && s.isNotEmpty).join(', ');
  }
}
