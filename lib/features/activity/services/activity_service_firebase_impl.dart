import 'package:bookzbox/features/activity/activity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseActivtiyService implements IActivtiyService {
  final _firestore = Firestore.instance;

  Future<Stream<Iterable<ActivityItem>>> activityFeed(String userId) async {
    return _firestore
        .collection('users')
        .document(userId)
        .collection('activity')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((ai) => ai.documents
            .map((doc) => ActivityItem.fromFirestore(doc.data, doc.documentID)));
  }

  @override
  Future<void> markAsRead(String userId, String activityId) async {
    try {
      await _firestore
          .collection('users')
          .document(userId)
          .collection('activity')
          .document(activityId)
          .setData({'read': true}, merge: true);
    } catch (e) {
      print('Error while attempting to mark an activity item with id '
          '($activityId) and userID ($userId) as read: $e');
    }
  }
}
