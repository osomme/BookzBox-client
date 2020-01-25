import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/feed/service/box_like_service.dart';
import 'package:dartz/dartz.dart';

class FirebaseBoxLikeService implements IBoxLikeService {
  @override
  Future<Either<NetworkError, bool>> isBoxLiked(String boxId, String userId) {
    return Future.value(Right(boxLikes.containsKey(boxId)));
  }

  @override
  Future<Either<NetworkError, bool>> likeBox(String boxId, String userId) {
    boxLikes[boxId] = true;
    return Future.value(Right(true));
  }

  @override
  Future<Either<NetworkError, bool>> removeLike(String boxId, String userId) {
    boxLikes.remove(boxId);
    return Future.value(Right(true));
  }

  // TODO: Remove and replace with actual Firebase service.
  final Map<String, bool> boxLikes = {};
}
