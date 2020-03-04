import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:dartz/dartz.dart';

class FirebaseBoxLikeService implements IBoxLikeService {
  @override
  Future<Either<NetworkError, bool>> isBoxLiked(String boxId, String userId) async {
    await Future.delayed(Duration(milliseconds: 500));
    return Future.value(Right(boxLikes.containsKey(boxId)));
  }

  @override
  Future<Either<NetworkError, bool>> likeBox(String boxId, String userId) async {
    boxLikes[boxId] = true;
    await Future.delayed(Duration(milliseconds: 500));
    return Future.value(Right(true));
  }

  @override
  Future<Either<NetworkError, bool>> removeLike(String boxId, String userId) async {
    boxLikes.remove(boxId);
    await Future.delayed(Duration(milliseconds: 500));
    return Future.value(Right(true));
  }

  // TODO: Remove and replace with actual Firebase service.
  final Map<String, bool> boxLikes = {};
}
