import 'package:bookzbox/features/box/models/models.dart';

extension BooksExtensions on List<Book> {
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
      final cmp = b.k.compareTo(a.k);
      if (cmp == 0) {
        return b.v.compareTo(a.v);
      }
      return cmp;
    });
    return pairs.map((x) => x.k.toUpperCase()).take(3).toSet().join(', ');
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
