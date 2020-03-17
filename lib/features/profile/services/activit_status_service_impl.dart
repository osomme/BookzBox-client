import 'package:bookzbox/features/profile/services/activity_status_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ActivityStatusService extends IActivityStatusService {
  final Firestore firestore = Firestore.instance;

  @override
  Future<bool> updateActivityStatus(String userId) async {
    // The updated activity status
    Map<String, dynamic> data = new Map();
    data.putIfAbsent('lastSeen', () => DateTime.now());

    bool success = false;

    await firestore
        .collection('users')
        .document(userId)
        .updateData(data)
        .then((_) => success = true)
        .catchError((err) => success = false);

    if (!success) {
      print("ERROR::ActivityStatusService.updateActivityStatus");
    }
    return success;
  }
}
