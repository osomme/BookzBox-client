import 'package:bookzbox/features/box/models/mini_box.dart';
import 'package:bookzbox/features/box/services/box_loader_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class BoxLoaderService extends IBoxLoaderService {
  final _firestore = Firestore.instance;

  @override
  Future<Either<String, List<MiniBox>>> loadForUser(String userId) async {
    // TODO: implement loadForUser
    return null;
  }

  @override
  Future<Stream<Iterable<MiniBox>>> loadUserFavorites(String userId) async {
    return _firestore
        .collection('users')
        .document(userId)
        .collection('liked_boxes')
        .orderBy('publishDateTime', descending: true)
        .snapshots()
        .map((snap) =>
            snap.documents.map((doc) => MiniBox.fromFirestore(doc.data, doc.documentID)));
  }
}
