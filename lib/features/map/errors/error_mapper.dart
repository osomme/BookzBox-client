import 'package:bookzbox/features/map/box_map.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';

extension MapErrorMapper on MapError {
  /// Maps an error to a localized string representation of that error.
  String toErrorString(BuildContext ctx) {
    switch (this) {
      case MapError.boxError:
        return S.of(ctx).mapErrorBoxesError;
      case MapError.noLocationPermissions:
        return S.of(ctx).mapErrorNoLocationPermission;
      default:
        throw 'Unknown error type';
    }
  }
}
