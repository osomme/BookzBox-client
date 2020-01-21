import 'package:bookzbox/features/new_box/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Represents a thumbnail view of a book.
class BookCard extends StatelessWidget {
  final Book book;

  BookCard({Key key, @required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image.asset(
          "assets/images/book_cover_demo.jpg",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
