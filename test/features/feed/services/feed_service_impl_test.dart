import 'package:bookzbox/features/feed/feed.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Feed service implementation', () {
    var service = FirebaseFeedService();

    setUp(() => service = FirebaseFeedService());

    test('[getNextBoxes] should return list of n size when n number of boxes is passed',
        () async {
      final result = await service.getNextBoxes(0, DateTime.now());
      result.fold(
        (error) => expect(false, isTrue),
        (data) => expect(data.length, equals(0)),
      );
    });

    test(
        '[getNextBoxes] should only return boxes that have a publishing date after the passed parameter',
        () async {
      final fetchingFrom = DateTime.now().subtract(Duration(days: 7));
      final result = await service.getNextBoxes(3, fetchingFrom);
      final mustBeInFuture = (box) => box.publishDateTime.isAfter(fetchingFrom);
      result.fold(
        (_) => expect(false, isTrue),
        (data) => expect(data.every((b) => mustBeInFuture(b)), isTrue),
      );
    });
  });
}
