extension StringExtensions on String {
  /// Returns a new string consisting of the first n characters from the original string.
  String take(int n) {
    if (n >= this.length) {
      return this;
    }
    StringBuffer sb = StringBuffer();
    for (int i = 0; i < n; i++) {
      sb.write(this[i]);
    }
    return sb.toString();
  }
}
