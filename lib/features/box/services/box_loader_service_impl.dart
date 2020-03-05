import 'package:bookzbox/features/box/helpers/mini_box_mapper.dart';
import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/box/models/mini_box.dart';
import 'package:bookzbox/features/box/services/box_loader_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class BoxLoaderService extends IBoxLoaderService {
  final firebase = Firestore.instance;

  @override
  Future<Either<String, List<MiniBox>>> loadForUser(String userId) async {
    String error;
    final boxes = await firebase
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
    final boxes = await firebase
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
}
