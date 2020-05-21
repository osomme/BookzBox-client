import 'package:bookzbox/common/utils/Location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Location Util', () {
    /// This test expects the default comparator for doubles to use
    /// an epsilon that is less than three decimal places.
    test(
        'When converting a coordinate to 250m accuracy radius, then it should be converted to the nearest half thousand decimal places.',
        () async {
      final double a = 59.263333;
      final double expectedA = 59.265;
      expect(Location.getCoordAt250mAccuracy(a), expectedA);

      final double b = 59.262222;
      final double expectedB = 59.26;
      expect(Location.getCoordAt250mAccuracy(b), expectedB);

      final double c = 59.267981;
      final double expectedC = 59.27;
      expect(Location.getCoordAt250mAccuracy(c), expectedC);

      final double d = -59.263333;
      final double expectedD = -59.265;
      expect(Location.getCoordAt250mAccuracy(d), expectedD);

      final double e = -59.262222;
      final double expectedE = -59.26;
      expect(Location.getCoordAt250mAccuracy(e), expectedE);

      final double f = -59.267981;
      final double expectedF = -59.27;
      expect(Location.getCoordAt250mAccuracy(f), expectedF);
    });
  });
}
