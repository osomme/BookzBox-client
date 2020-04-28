import 'package:bookzbox/features/box/helpers/box_mapper.dart';
import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class BoxDetailsFirebaseService implements IBoxDetailsService {
  final _firestore = Firestore.instance;

  /// Fetches a box from Firebase.
  ///
  /// [boxId] The id of the `Box` to fetch. This it much match the document in Firestore.
  /// Returns the fetched `Box` on success and an error on failure.
  @override
  Future<Either<BoxDetailsError, Box>> getBox(String boxId) async {
    final doc = await _firestore.collection('boxes').document(boxId).get();
    return doc.exists ? right(BoxMapper.fromFirebase(doc)) : left(BoxDetailsError.notFound);
  }
}
