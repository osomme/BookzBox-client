import 'package:flutter/material.dart';

class Profile {
  final int rating;
  final int tradeCount;

  /// The date of user registration.
  final DateTime joinDate;

  Profile({@required this.rating, @required this.tradeCount, @required this.joinDate});
}
