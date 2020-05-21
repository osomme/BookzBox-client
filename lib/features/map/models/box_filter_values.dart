import 'package:bookzbox/features/map/box_map.dart';

/// Enums which represent the different levels that box published date can be filtered on.
enum DateLimit {
  /// Limit to 1 day (24 hours)
  OneDay,

  /// Limit to 7 days.
  SevenDays,

  /// Limit to 30 days.
  ThirtyDays,

  /// Allow all boxes from any published date.
  NoLimit,
}

/// Class which contains immutable filter query values that can be used in a box filtering query.
class BoxFilterValues {
  List<bool Function(BoxMapItem)> _filters = List();

  bool _hasAnyFilter = false;

  /// The input box title or description text.
  final String boxTitleOrDescriptionText;

  /// The input author name.
  final String authorName;

  /// The input book title.
  final String bookTitle;

  /// The published date limitation.
  final DateLimit dateLimitation;

  BoxFilterValues({
    this.boxTitleOrDescriptionText,
    this.authorName,
    this.bookTitle,
    this.dateLimitation,
  }) {
    _createFilter();
    _hasAnyFilter = _filters.isNotEmpty;
  }

  /// Creates a new instance of the class with no filters applied.
  factory BoxFilterValues.noFilters() => BoxFilterValues();

  /// Retrieve a list of functions that can be used to filter a list of [BoxMapItem] objects.
  List<bool Function(BoxMapItem)> get filters => _filters;

  /// Whether there are any filters set.
  bool get hasAnyFilter => _hasAnyFilter;

  void _createFilter() {
    final filters = List<bool Function(BoxMapItem)>();

    if (boxTitleOrDescriptionText != null && boxTitleOrDescriptionText.isNotEmpty) {
      filters.add(BoxQueryMapper.titleDescriptionFunc(boxTitleOrDescriptionText));
    }

    if (authorName != null && authorName.isNotEmpty) {
      filters.add(BoxQueryMapper.authorName(authorName));
    }

    if (bookTitle != null && bookTitle.isNotEmpty) {
      filters.add(BoxQueryMapper.bookTitle(bookTitle));
    }

    if (dateLimitation != null && dateLimitation != DateLimit.NoLimit) {
      filters.add(
          BoxQueryMapper.publishedDateFunc(_getDateTimeFromDateLimit(dateLimitation)));
    }

    _filters = filters;
  }

  DateTime _getDateTimeFromDateLimit(DateLimit limit) {
    switch (limit) {
      case DateLimit.NoLimit:
        return null; // All box publish dates are valid.
      case DateLimit.OneDay:
        return DateTime.now().subtract(Duration(hours: 24));
      case DateLimit.SevenDays:
        return DateTime.now().subtract(Duration(days: 7));
      case DateLimit.ThirtyDays:
        return DateTime.now().subtract(Duration(days: 30));
      default:
        return null;
    }
  }
}
