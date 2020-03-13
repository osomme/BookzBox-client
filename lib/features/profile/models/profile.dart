import 'package:bookzbox/features/profile/models/book_subjects.dart';
import 'package:flutter/material.dart';

class Profile {
  final String userId;
  final String displayName;
  final int rating;
  final int tradeCount;
  final String photoUrl;

  /// The date of user registration.
  final DateTime joinDate;

  /// The last date stored by Firebase for this user.
  final DateTime lastSeen;

  final List<BookSubject> favoriteGenres;

  Profile({
    @required this.userId,
    @required this.displayName,
    @required this.rating,
    @required this.tradeCount,
    @required this.joinDate,
    @required this.photoUrl,
    @required this.lastSeen,
    @required this.favoriteGenres,
  });
}
