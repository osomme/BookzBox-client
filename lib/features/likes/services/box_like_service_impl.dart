import 'dart:collection';

import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

/// Firebase-based implementation of the [IBoxLikeService] interface.
class FirebaseBoxLikeService implements IBoxLikeService {
  final _firestore = Firestore.instance;

  final Map<String, String> _boxLikeCache = {};

  FirebaseBoxLikeService._privateConstructor();

  static final instance = FirebaseBoxLikeService._privateConstructor();

  /// Retrives a stream of likes for a particular user.
  /// [userId] the userId of the owner who's like stream you want to retrieve.
  @override
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

  /// Removes a like from the Firebase database.
  /// [boxId] the ID of the box that the user wishes to remove a like from.
  /// [userId] the ID of the user that wishes to remove a like.
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

  /// Adds a like to the Firebase database.
  /// [boxId] the ID of the box that the user wishes to add a like to.
  /// [userId] the user that wishes to add a like.
  @override
  Future<Either<NetworkError, bool>> addLike(String boxId, String userId) async {
    final like = {
      'likedByUserId': userId,
      'boxId': boxId,
      'timestamp': FieldValue.serverTimestamp(),
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
