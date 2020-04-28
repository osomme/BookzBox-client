import 'package:bookzbox/features/box/services/box_removal_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BoxRemovalService extends IBoxRemovalService {
  final Firestore firestore = Firestore.instance;

  /// Removes the box with id [boxId] from Firestore.
  ///
  /// Returns `true` if successfull; otherwise `false`.
  @override
  Future<bool> remove(String boxId) async {
    String error;

    await firestore.collection('boxes').document(boxId).delete().catchError((err) => error = err);

    if (error != null) {
      // DEBUG
      print("ERROR::BoxUpdaterService::$error");
      return false;
    }
    return true;
  }
}
