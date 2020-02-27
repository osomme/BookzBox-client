import 'package:bookzbox/features/box/helpers/BoxMapper.dart';
import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class BoxDetailsFirebase implements IBoxDetailsService {
  final _firestore = Firestore.instance;

  @override
  Future<Either<BoxDetailsError, Box>> getBox(String boxId) async {
    final doc = await _firestore.collection('boxes').document(boxId).get();
    return doc.exists
        ? right(BoxMapper.fromFirebase(doc))
        : left(BoxDetailsError.notFound);
  }
}
