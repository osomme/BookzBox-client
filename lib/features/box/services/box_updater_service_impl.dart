import 'package:bookzbox/features/box/helpers/box_mapper.dart';
import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/box/services/box_updater_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class BoxUpdaterService extends IBoxUpdaterService {
  final Firestore firestore = Firestore.instance;

  @override
  Future<Either<String, Box>> updateStatus(Box updatedBox) async {
    String error;
    await firestore
        .collection('boxes')
        .document(updatedBox.id)
        .updateData(BoxMapper.map(updatedBox))
        .catchError((err) => error = err);

    if (error != null) {
      // DEBUG
      print("ERROR::BoxUpdaterService::$error");
      return left(error);
    }
    return right(updatedBox);
  }
}
