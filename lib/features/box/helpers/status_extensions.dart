import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';

extension StatusMapper on int {
  BoxStatus toBoxStatus() {
    switch (this) {
      case 0:
        return BoxStatus.public;
      case 1:
        return BoxStatus.private;
      case 2:
        return BoxStatus.traded;
      default:
        throw 'Failed to map $this to BoxStatus';
    }
  }
}

extension StatusLocalization on BoxStatus {
  String toLocalizedString(BuildContext context) {
    if (this == BoxStatus.private) {
      return S.of(context).boxStatusPrivate;
    } else if (this == BoxStatus.public) {
      return S.of(context).boxStatusPublic;
    } else if (this == BoxStatus.traded) {
      return S.of(context).boxStatusTraded;
    }
    throw 'Failed to map $this to localized string';
  }
}
