import 'package:bookzbox/features/activity/activity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseActivtiyService implements IActivtiyService {
  final _firestore = Firestore.instance;

  Future<Stream<Iterable<ActivityItem>>> activityFeed(String userId) async {
    return _firestore
        .collection('users')
        .document(userId)
        .collection('activity')
        .snapshots()
        .map((ai) => ai.documents
            .map((doc) => ActivityItem.fromFirestore(doc.data, doc.documentID)));
  }
}
