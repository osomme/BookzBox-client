extension Math on double {
  /// Rounds the double down to the given decimal place.
  /// F.eks 59.2633 -> 59.26 with a [place] of 0.01
  /// F.eks 59.2684 -> 59.26 with a [place] of 0.01
  double roundDown(double place) {
    return (this / place).floor() * place;
  }
}
