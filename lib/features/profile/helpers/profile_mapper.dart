import 'package:bookzbox/features/profile/models/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileMapper {
  /// Maps the snapshot from Firestore to a Profile object.
  /// [ds] must NOT be NULL.
  static Profile fromFirestore(DocumentSnapshot ds) {
    final Map<String, dynamic> data = ds.data;

    return Profile(
      userId: data['uid'] as String,
      displayName: data['displayName'] as String,
      photoUrl: data['photoURL'] as String,
      joinDate: (data['registeredOn'] as Timestamp).toDate(),
      tradeCount: (data.containsKey('tradeCount') ? data['tradeCount'] as int : -1),
      rating: (data.containsKey('rating') ? data['rating'] as int : -1),
    );
  }
}
