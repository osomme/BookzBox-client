import 'package:bookzbox/features/box/helpers/mini_box_mapper.dart';
import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/box/models/mini_box.dart';
import 'package:bookzbox/features/box/services/box_loader_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class BoxLoaderService extends IBoxLoaderService {
  final _firestore = Firestore.instance;

  /// Fetch all boxes for the user with id equal to [userId].
  /// This function attempts to load private boxes. The [userId]
  /// must therefore match that of the authenticated user.
  @override
  Future<Either<String, List<MiniBox>>> loadForUser(String userId) async {
    String error;
    final boxes = await _firestore
        .collection('users')
        .document(userId)
        .collection('boxes')
        .getDocuments()
        .then((docs) => docs.documents.map((ds) => MiniBoxMapper.fromFirestore(ds)).toList())
        .catchError((err) => error = err);

    if (boxes == null) {
      print("ERROR::BoxLoaderService.loadForUser::$error");
      return left(error);
    }
    return right(boxes);
  }

  /// Only loads boxes with PUBLIC status as these are loaded by a user
  /// that does not own the boxes.
  Future<Either<String, List<MiniBox>>> loadForOtherUser(String userId) async {
    String error;
    final boxes = await _firestore
        .collection('users')
        .document(userId)
        .collection('boxes')
        .where('status', isEqualTo: BoxStatus.public.index)
        .getDocuments()
        .then((docs) => docs.documents.map((ds) => MiniBoxMapper.fromFirestore(ds)).toList())
        .catchError((err) => error = err);

    if (boxes == null) {
      print("ERROR::BoxLoaderService.loadForUser::$error");
      return left(error);
    }
    return right(boxes);
  }

  @override
  Future<Stream<Iterable<MiniBox>>> loadUserFavorites(String userId) async {
    return _firestore
        .collection('users')
        .document(userId)
        .collection('liked_boxes')
        .orderBy('publishDateTime', descending: true)
        .snapshots()
        .map(
            (snap) => snap.documents.map((doc) => MiniBox.fromFirestore(doc.data, doc.documentID)));
  }
}
