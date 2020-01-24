import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/feed/service/box_like_service.dart';
import 'package:dartz/dartz.dart';

class FirebaseBoxLikeService implements IBoxLikeService {
  @override
  Future<Either<NetworkError, bool>> isBoxLiked(String boxId, String userId) {
    // TODO: implement isBoxLiked
    return null;
  }

  @override
  Future<Either<NetworkError, void>> likeBox(String boxId, String userId) {
    // TODO: implement likeBox
    return null;
  }

  @override
  Future<Either<NetworkError, void>> removeLike(String boxId, String userId) {
    // TODO: implement removeLike
    return null;
  }
}
