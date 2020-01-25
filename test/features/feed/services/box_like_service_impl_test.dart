import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/feed/service/box_like_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Firebase box like service', () {
    //TODO: Update tests after implementing actual Firebase service.
    var service = FirebaseBoxLikeService();
    final user = User('abcd');
    final boxId = 'box1';

    setUp(() => service = FirebaseBoxLikeService());

    test('[isBoxLiked] should return true if user has liked the box', () async {
      await service.likeBox(boxId, user.uid);
      final result = await service.isBoxLiked(boxId, user.uid);
      result.fold(
        (error) => fail(error.toString()),
        (x) => expect(x, isTrue),
      );
    });

    test('[isBoxLiked] should return false if user has not liked the box', () async {
      final result = await service.isBoxLiked(boxId, user.uid);
      result.fold(
        (error) => fail(error.toString()),
        (x) => expect(x, isFalse),
      );
    });

    test('[likeBox] should return true when successful', () async {
      final result = await service.likeBox(boxId, user.uid);
      result.fold(
        (error) => fail(error.toString()),
        (res) => expect(res, isTrue),
      );
    });

    test('[removeLike] should return true when successful', () async {
      final result = await service.removeLike(boxId, user.uid);
      expect(
          result.fold(
            (error) => false,
            (res) => true,
          ),
          isTrue);
    });
  });
}
