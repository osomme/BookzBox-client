import 'package:flutter/material.dart';

/// Domain model class representing a match.
class Match {
  /// The ID of the match.
  final String matchId;
  // Whether the match is currently active or not.
  final bool active;

  /// A list of IDs of the users that are participating in the match.
  final List<String> participants;

  Match({
    @required this.matchId,
    @required this.active,
    @required this.participants,
  });

  /// Maps a Firestore document into an instance of the [Match] domain model class.
  ///
  /// [data] The Firestore document for one match.
  /// [id] The ID of the match.
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
