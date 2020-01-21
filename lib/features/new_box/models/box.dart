import 'package:bookzbox/features/authentication/models/user_model.dart';

import 'book.dart';

/// Represents a box of books.
class Box {
  User publisher;

  List<Book> books;

  /// A description of the box content.
  ///
  /// For example, "The box contains 10 damagaded Spiderman comic books from 1990.".
  String description;
}
