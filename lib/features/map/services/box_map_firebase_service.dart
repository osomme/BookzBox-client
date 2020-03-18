import 'package:bookzbox/features/map/box_map.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class BoxMapFirebaseService implements IMapBoxService {
  final _firestore = Firestore.instance;

  @override
  Future<Either<MapError, List<BoxMapItem>>> getAllBoxes() async {
    try {
      final boxes = await _firestore
          .collection('map_boxes')
          .where('status', isEqualTo: 0)
          .getDocuments()
          .then(
              (docs) => docs.documents.map((b) => BoxMapItem.fromFirestore(b)).toList());

      return right(boxes);
    } catch (e) {
      print(e);
      return left(MapError.boxError);
    }
  }
}
