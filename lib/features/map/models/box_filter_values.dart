import 'package:bookzbox/features/map/box_map.dart';

enum DateLimit { OneDay, SevenDays, ThirtyDays, NoLimit }

class BoxFilterValues {
  List<bool Function(BoxMapItem)> _filters = List();

  bool _hasAnyFilter = false;

  final String boxTitleOrDescriptionText;
  final String authorName;
  final String bookTitle;
  final DateLimit dateLimitation;

  BoxFilterValues({
    this.boxTitleOrDescriptionText,
    this.authorName,
    this.bookTitle,
    this.dateLimitation,
  }) {
    _createFilter();
    if (_filters.isNotEmpty) {
      _hasAnyFilter = true;
    }
  }

  /// Creates a new instance of the class with no filters applied.
  factory BoxFilterValues.noFilters() => BoxFilterValues();

  List<bool Function(BoxMapItem)> get filters => _filters;

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
