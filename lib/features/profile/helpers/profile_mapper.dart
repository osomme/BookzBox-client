import 'package:bookzbox/features/profile/helpers/book_subject_mapper.dart';
import 'package:bookzbox/features/profile/models/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileMapper {
  /// Maps the snapshot from Firestore to a Profile object.
  ///
  /// [ds] A Firestore snapshot that must NOT be NULL.
  /// Returns a [Profile] containing the data of [ds].
  static Profile fromFirestore(DocumentSnapshot ds) {
    final Map<String, dynamic> data = ds.data;

    print('User profile data:');
    print(data);

    return Profile(
      userId: data['uid'] as String,
      displayName: data['displayName'] as String,
      photoUrl: data['photoURL'] as String,
      joinDate: (data['registeredOn'] as Timestamp).toDate(),
      lastSeen: (data['lastSeen'] as Timestamp).toDate(),
      tradeCount: (data.containsKey('tradeCount') ? data['tradeCount'] as int : 0),
      rating: (data.containsKey('rating') ? data['rating'] as int : 0),
      favoriteGenres:
          (data.containsKey('favoriteGenres') ? BookSubjectMapper.fromFirestore(data) : List()),
    );
  }
}
