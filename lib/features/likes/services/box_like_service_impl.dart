import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FirebaseBoxLikeService implements IBoxLikeService {
  final _firestore = Firestore.instance;

  final Map<String, String> _boxLikeCache = {};

  bool _hasLoadedFromNetwork = false;

  @override
  Future<Either<NetworkError, bool>> isBoxLiked(String boxId, String userId) async {
    if (_boxLikeCache.containsKey(boxId)) {
      // Box is already in cache of liked boxes.
      print('Like is in cache');
      return right(true);
    }

    if (_hasLoadedFromNetwork) {
      // Likes have already been loaded, but the box is not in the cache.
      return right(false);
    }

    try {
      print('Fetching like statuses from server');
      final snap = await _firestore
          .collection('likes')
          .where('likedByUserId', isEqualTo: userId)
          .getDocuments();
      _hasLoadedFromNetwork = true;
      if (snap.documents.isEmpty) {
        return right(false);
      } else {
        print('Number of likes loaded from server: ${snap.documents.length}');
        var isBoxLiked = false;
        snap.documents.forEach((doc) {
          final id = doc.data['boxId'];
          if (id == boxId) {
            isBoxLiked = true;
          }
          _boxLikeCache[id] = doc.documentID;
        });
        return right(isBoxLiked);
      }
    } catch (e) {
      print('Error while attempting to load likes: $e');
      _hasLoadedFromNetwork = false;
      return left(NetworkError.noInternet);
    }
  }

  @override
  Future<Either<NetworkError, bool>> removeLike(String boxId, String userId) async {
    if (_boxLikeCache.containsKey(boxId)) {
      try {
        await _firestore.collection('likes').document(_boxLikeCache[boxId]).delete();
        _boxLikeCache.remove(boxId);
      } catch (e) {
        print('Error while attempting to remove like: $e');
        return left(NetworkError.noInternet);
      }
    }
    return (right(false));
  }

  @override
  Future<Either<NetworkError, bool>> addLike(String boxId, String userId) async {
    final like = {
      'likedByUserId': userId,
      'boxId': boxId,
      'timestamp': DateTime.now(),
    };

    try {
      final docRef = await _firestore.collection('likes').add(like);
      _boxLikeCache[boxId] = docRef.documentID;
      return right(true);
    } catch (e) {
      print('Error while attempting to add like: $e');
      return left(NetworkError.noInternet);
    }
  }
}
