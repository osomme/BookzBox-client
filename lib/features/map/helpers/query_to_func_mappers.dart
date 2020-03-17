import 'package:bookzbox/features/map/box_map.dart';

/// A collection of static functions that can be used to convert a string into a function to be used to filter boxes.
abstract class BoxQueryMapper {
  /// Returns the a function which can be used to filter on a box's title and description property.
  static bool Function(BoxMapItem) titleDescriptionFunc(String query) =>
      (box) => box.title.contains(query) || box.description.contains(query);

  /// Returns a function which determines whether a [BoxMapItem] was published
  /// after the date passed in the [date] parameter.
  static bool Function(BoxMapItem) publishedDateFunc(DateTime date) =>
      (box) => box.publishedOn.isAfter(date);
}
