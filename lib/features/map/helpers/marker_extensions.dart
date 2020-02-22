import 'package:google_maps_flutter/google_maps_flutter.dart';

extension MarkerExtension on Marker {
  Marker copyWith({
    MarkerId markerId,
    LatLng position,
    Function onTap,
    BitmapDescriptor icon,
  }) {
    return Marker(
      markerId: markerId ?? this.markerId,
      position: position ?? this.position,
      onTap: onTap ?? this.onTap,
      icon: icon ?? this.icon,
    );
  }
}
