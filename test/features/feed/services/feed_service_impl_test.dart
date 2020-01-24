import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Feed service implementation', () {
    var service = FirebaseFeedService();

    setUp(() => service = FirebaseFeedService());

    test('[getNextBoxes] should return list of n size when n number of boxes is passed',
        () async {
      final n = 1;
      final result = await service.getNextBoxes(n, DateTime.now());
      result.fold(
        (error) => fail('Failed with: $error'),
        (data) => expect(data.length, equals(n)),
      );
    });

    test(
        '[getNextBoxes] should only return boxes that have a publishing date after the passed parameter',
        () async {
      final fetchingFrom = DateTime.now().subtract(Duration(days: 7));
      final result = await service.getNextBoxes(3, fetchingFrom);
      final areInFuture = (box) => box.publishDateTime.isAfter(fetchingFrom);
      result.fold(
        (error) => fail('Failed with: $error'),
        (data) => expect(data.every((b) => areInFuture(b)), isTrue),
      );
    });

    test('[getNextBoxes] should not return any boxes that are NOT public', () async {
      final result = await service.getNextBoxes(100, DateTime.now());
      result.fold(
        (error) => fail('Failed with: $error'),
        (data) => expect(data.every((b) => b.status == BoxStatus.public), isTrue),
      );
    });

    test(
        '[getNextBoxes] should return "noInternet" error when client has no internet connection',
        () async {
      fail('Failed with: NOT IMPLEMENTED');
    });
  });
}
