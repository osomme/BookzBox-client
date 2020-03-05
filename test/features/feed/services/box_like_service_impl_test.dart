import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Firebase box like service', () {
    //TODO: Update tests after implementing actual Firebase service.
    var service = FirebaseBoxLikeService.instance;
    final user = User('abcd');
    final boxId = 'box1';

    setUp(() => service = FirebaseBoxLikeService.instance);

    test('[isBoxLiked] should return true if user has liked the box', () async {
      fail('To be implemented');
    });

    test('[isBoxLiked] should return false if user has not liked the box', () async {
      fail('To be implemented');
    });

    test('[likeBox] should return true when successful', () async {
      final result = await service.addLike(boxId, user.uid);
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
