import 'package:bookzbox/features/map/box_map.dart';

/// A collection of static functions that can be used to convert a string into a function to be used to filter boxes.
abstract class BoxQueryMapper {
  /// Returns a function which can be used to filter on a box's title and description property.
  ///
  /// [query] The title or description that is being filtered on.
  static bool Function(BoxMapItem) titleDescriptionFunc(String query) {
    final sanitizedQuery = query.trim().toLowerCase();
    return (box) =>
        box.title.toLowerCase().contains(sanitizedQuery) ||
        box.description.toLowerCase().contains(sanitizedQuery);
  }

  /// Returns a function which determines whether a [BoxMapItem] was published
  /// after the date passed in the [date] parameter.
  ///
  /// [date] The date that is being filtered on.
  static bool Function(BoxMapItem) publishedDateFunc(DateTime date) =>
      (box) => box.publishedOn.isAfter(date);

  /// Returns a function that checks whether the box has any books written by the author passed in the parameter.
  ///
  /// [author] The name of the author that is being filtered for.
  static bool Function(BoxMapItem) authorName(String author) => (box) => box.books.any(
      (b) => b.authors.any((a) => a.toLowerCase().contains(author.trim().toLowerCase())));

  /// Returns a function that checks if any books in the box have a title that matches the parameter.
  ///
  /// [title] The title of the book that is being filtered for.
  static bool Function(BoxMapItem) bookTitle(String title) => (box) =>
      box.books.any((b) => b.title.toLowerCase().contains(title.trim().toLowerCase()));
}
