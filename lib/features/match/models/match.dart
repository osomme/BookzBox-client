import 'package:flutter/material.dart';

class Match {
  final String matchId;
  final bool active;
  final List<String> participants;

  Match({
    @required this.matchId,
    @required this.active,
    @required this.participants,
  });

  factory Match.fromFirestore(Map<dynamic, dynamic> data, String id) {
    return Match(
      matchId: id,
      active: data['active'],
      participants: List.from(data['participants']),
    );
  }

  @override
  String toString() =>
      '[MATCH] id: $matchId, active: $active, participants: ${participants.join(', ')}';
}
