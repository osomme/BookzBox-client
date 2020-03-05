import 'dart:async';
import 'dart:collection';

import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:mobx/mobx.dart';

part 'box_like_store.g.dart';

class BoxLikeStore = _BoxLikeStore with _$BoxLikeStore;

abstract class _BoxLikeStore with Store {
  final IBoxLikeRepository _repo;
  final IAuthService _authService;
  final String _boxId;

  StreamSubscription<HashSet<String>> _streamSubscription;

  @observable
  bool _isLoading = false;

  @observable
  bool _isLiked = false;

  @observable
  NetworkError _error;

  _BoxLikeStore(this._repo, this._authService, this._boxId,
      {bool shouldImmediatlyCheckStatus = true}) {
    if (shouldImmediatlyCheckStatus) {
      _checkIfLiked();
    }
  }

  /// True if the store is currently loading the like status, false otherwise.
  @computed
  bool get isLoading => _isLoading;

  /// True if the box is liked by the user, false otherwise.
  @computed
  bool get isLiked => _isLiked;

  /// A potential error message for the store.
  @computed
  NetworkError get errorMessage => _error;

  // Toggles the like status of the box.
  @action
  Future<void> toggleLikeStatus() async {
    _isLoading = true;
    _error = null;
    if (isLiked) {
      await _removeLike();
    } else {
      await _addLike();
    }
    _isLoading = false;
  }

  @action
  Future<void> _removeLike() async {
    final result = await _repo.removeLike(_boxId, (await _authService.user).uid);
    result.fold(
      (error) => _error = error,
      (success) => print('Removed like from box: $_boxId'),
    );
  }

  @action
  Future<void> _addLike() async {
    final result = await _repo.addLike(_boxId, (await _authService.user).uid);
    result.fold(
      (error) => _error = error,
      (success) => print('Liked box: $_boxId'),
    );
  }

  @action
  Future<void> _checkIfLiked() async {
    _isLoading = true;
    final uid = (await _authService.user).uid;
    final stream = await _repo.likesStreamFor(uid);
    _streamSubscription = stream.listen(
      (data) {
        final liked = data.contains(_boxId);
        if (liked != _isLiked) {
          _isLiked = liked;
        }
      },
      onError: (error) => print('Error while listening to likes stream: $error'),
    );
    _isLoading = false;
  }

  void dispose() => _streamSubscription?.cancel();
}
