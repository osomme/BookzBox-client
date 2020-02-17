import 'package:bookzbox/features/feed/feed.dart';

extension BooksExtensions on List<BoxFeedBook> {
  /// Maps a list of books to a string consisting of the category
  /// names of the three most popular genres in the list.
  String toCategoryString() {
    final flattened = this.map((b) => b.categories).reduce((acc, x) => acc..addAll(x));
    final map = Map<String, int>();
    flattened.forEach((x) {
      if (map.containsKey(x)) {
        map[x] = map[x] + 1;
      } else {
        map[x] = 1;
      }
    });
    final pairs = List<_Pair>();
    map.forEach((k, v) => pairs.add(_Pair(k, v)));
    pairs.sort((a, b) {
      final cmp = b.v.compareTo(a.v);
      if (cmp == 0) {
        return b.k.compareTo(a.k);
      }
      return cmp;
    });
    return pairs.map((x) => x.k.toUpperCase()).toSet().take(3).join(', ');
  }
}

/// Helper class used for the toCategoryString extension function for the List<Book> class.
class _Pair {
  final String k;
  final int v;

  _Pair(this.k, this.v);

  @override
  String toString() {
    return '$k => $v';
  }
}
