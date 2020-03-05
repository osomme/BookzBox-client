import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';

extension DateTimeDifferenceLocalizer on DateTime {
  /// Returns the time difference between now and the DateTime object that this is called on, as a localized string.
  String toTimeDifferenceString(BuildContext context) {
    if (_shouldGetInSeconds(this)) {
      return S.of(context).dateSecondsAgo(DateTime.now().difference(this).inSeconds);
    } else if (_shouldGetInMinutes(this)) {
      return S.of(context).dateMinutesAgo(DateTime.now().difference(this).inMinutes);
    } else if (_shouldGetInHours(this)) {
      return S.of(context).dateHoursAgo(DateTime.now().difference(this).inHours);
    } else {
      return S.of(context).dateDaysAgo(DateTime.now().difference(this).inDays);
    }
  }

  bool _shouldGetInSeconds(DateTime time) {
    return DateTime.now().difference(time).inSeconds < 60;
  }

  bool _shouldGetInMinutes(DateTime time) {
    return DateTime.now().difference(time).inMinutes < 60;
  }

  bool _shouldGetInHours(DateTime time) {
    return DateTime.now().difference(time).inHours < 24;
  }
}
