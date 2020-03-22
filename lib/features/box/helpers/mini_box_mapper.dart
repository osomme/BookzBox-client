import 'package:bookzbox/features/box/models/mini_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookzbox/features/box/helpers/status_extensions.dart';

class MiniBoxMapper {
  /// Maps the snapshot from Firestore to a MiniBox object.
  /// [ds] must NOT be NULL.
  static MiniBox fromFirestore(DocumentSnapshot ds) {
    final Map<String, dynamic> data = ds.data;
    print(data);
    return MiniBox(
      id: ds.documentID,
      status: (data['status'] as int).toBoxStatus(),
      publishDateTime: DateTime.fromMillisecondsSinceEpoch((data['publishDateTime'] as int)),
      title: data['title'],
      bookThumbnailUrl: data['bookThumbnailUrl'],
    );
  }
}
