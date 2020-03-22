import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/box/helpers/book_mapper.dart';
import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/box/helpers/status_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BoxMapper {
  static Map<String, dynamic> map(final Box box) {
    return {
      "publisher": box.publisher.uid,
      "books": box.books.map((b) => BookMapper.map(b)).toList(),
      "status": box.status.index,
      "publishDateTime": box.publishDateTime.millisecondsSinceEpoch,
      "latitude": box.latitude,
      "longitude": box.longitude,
      "title": box.title,
      "description": box.description
    };
  }

  static Box fromFirebase(DocumentSnapshot doc) {
    final data = doc.data;

    return Box(
      id: doc.documentID,
      publisher: User(data['publisher'] as String),
      books: BookMapper.booksFromFirebase(data['books']),
      status: (data['status'] as int).toBoxStatus(),
      publishDateTime: DateTime.fromMillisecondsSinceEpoch((data['publishDateTime'] as int)),
      latitude: data['latitude'],
      longitude: data['longitude'],
      title: data['title'],
      description: data['description'],
    );
  }
}
