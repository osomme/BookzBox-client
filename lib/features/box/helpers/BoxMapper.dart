import 'package:bookzbox/features/box/helpers/BookMapper.dart';
import 'package:bookzbox/features/box/models/models.dart';
import 'package:uuid/uuid.dart';

class BoxMapper {
  static Map<String, dynamic> map(final Box box) {
    List<Map<String, dynamic>> serializedBooks = List();
    box.books.forEach((book) => serializedBooks.add(BookMapper.map(book)));

    return {
      "id": Uuid().v1(),
      "publisher": box.publisher.uid,
      "books": serializedBooks,
      "status": box.status.index,
      "publishDateTime": box.publishDateTime.millisecondsSinceEpoch,
      "latitude": box.latitude,
      "longitude": box.longitude,
      "title": box.title,
      "description": box.description
    };
  }
}
