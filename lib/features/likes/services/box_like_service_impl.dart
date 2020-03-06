import 'dart:collection';

import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FirebaseBoxLikeService implements IBoxLikeService {
  final _firestore = Firestore.instance;

  final Map<String, String> _boxLikeCache = {};

  FirebaseBoxLikeService._privateConstructor();

  static final instance = FirebaseBoxLikeService._privateConstructor();

  Future<Stream<HashSet<String>>> likesStreamFor(String userId) async {
    return _firestore
        .collection('likes')
        .where('likedByUserId', isEqualTo: userId)
        .snapshots()
        .map(
          (snap) => snap.documents.map((doc) {
            final boxId = doc.data['boxId'];
            _boxLikeCache[boxId] = doc.documentID;
            return boxId;
          }),
        )
        .map((iter) => HashSet<String>.from(iter))
        .asBroadcastStream();
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
      await _firestore.collection('likes').add(like);
      return right(true);
    } catch (e) {
      print('Error while attempting to add like: $e');
      return left(NetworkError.noInternet);
    }
  }
}
