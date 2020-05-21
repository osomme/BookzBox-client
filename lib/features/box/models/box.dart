import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/box/models/book.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'box.g.dart';

/// Enum representing the status of the box.
@HiveType(typeId: 3)
enum BoxStatus {
  /// The box has not been traded and can be seen by other users.
  @HiveField(0)
  public,

  /// The box is uploaded, but is private and cannot be seen by other users.
  @HiveField(1)
  private,

  /// The box has been traded.
  @HiveField(2)
  traded,
}

/// Represents a box of books.
class Box {
  /// The ID of the box.
  String id;

  /// The user that published the box.
  final User publisher;

  /// A list of [Book] objects.
  final List<Book> books;

  /// The current [BoxStatus] of the box.
  BoxStatus status;

  /// The timestamp of when the box was published.
  final DateTime publishDateTime;

  /// The latitudinal coordinates of the box's location.
  final double latitude;

  /// The longitudinal coordinates of the box's location.
  final double longitude;

  /// The title of the box.
  final String title;

  /// The description of the box.
  final String description;

  Box({
    @required this.id,
    @required this.publisher,
    @required this.books,
    @required this.status,
    @required this.publishDateTime,
    @required this.latitude,
    @required this.longitude,
    @required this.title,
    @required this.description,
  });
}
