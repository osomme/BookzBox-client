import 'package:bookzbox/features/authentication/models/user_model.dart';

import 'book.dart';

enum BoxStatus { public, private, traded }

/// Represents a box of books.
class Box {
  User publisher;
  List<Book> books;
  BoxStatus status;
  DateTime publishDateTime;
  double latitude;
  double longitude;
  String title;
  String description;
}
