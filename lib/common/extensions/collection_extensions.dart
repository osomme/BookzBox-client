import 'package:bookzbox/features/box/models/models.dart';

extension BooksExtensions on List<Book> {
  /// Maps a list of books to a string consisting of the category
  /// names of the three most popular genres in the list.
  String toCategoryString() {
    final map = this.map((b) => b.categories).reduce((acc, x) => acc..addAll(x)).asMap();
    final x = List<_Pair>();
    map.forEach((k, v) => x.add(_Pair(k, v)));
    x.sort((a, b) => a.k.compareTo(b.k));
    return x.map((x) => x.v.toUpperCase()).take(3).toSet().join(', ');
  }
}

/// Helper class used for the toCategoryString extension function for the List<Book> class.
class _Pair {
  final int k;
  final String v;

  _Pair(this.k, this.v);
}
