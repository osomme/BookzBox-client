import 'package:flutter/material.dart';

class Match {
  final String matchId;
  final bool active;

  Match({
    @required this.matchId,
    @required this.active,
  });

  factory Match.fromFirestore(Map<dynamic, dynamic> data, String id) {
    return Match(
      matchId: id,
      active: data['active'],
    );
  }
}
