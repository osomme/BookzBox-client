import 'package:flutter/material.dart';

class Profile {
  final String userId;
  final String displayName;
  final int rating;
  final int tradeCount;

  /// The date of user registration.
  final DateTime joinDate;

  Profile({
    @required this.userId,
    @required this.displayName,
    @required this.rating,
    @required this.tradeCount,
    @required this.joinDate,
  });
}
