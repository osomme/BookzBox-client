import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:mobx/mobx.dart';

part 'box_item_store.g.dart';

class BoxItemStore = _BoxItemStore with _$BoxItemStore;

abstract class _BoxItemStore with Store {
  final IBoxLikeRepository _repo;
  final IAuthService _authService;
  final Box _box;

  @observable
  bool _isLoading = false;

  @observable
  bool _isLiked = false;

  @observable
  NetworkError _error;

  _BoxItemStore(this._repo, this._authService, this._box) {
    _checkIfLiked();
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
    if (isLiked) {
      await _removeLike();
    } else {
      await _addLike();
    }
    _isLoading = false;
  }

  @action
  Future<void> _removeLike() async {
    final result = await _repo.removeLike(_box.id, (await _authService.user).uid);
    result.fold(
      (error) => _error = error,
      (success) => _isLiked = false,
    );
  }

  @action
  Future<void> _addLike() async {
    final result = await _repo.likeBox(_box.id, (await _authService.user).uid);
    result.fold(
      (error) => _error = error,
      (success) => _isLiked = true,
    );
  }

  @action
  Future<void> _checkIfLiked() async {
    _isLoading = true;
    final result = await _repo.isBoxLiked(_box.id, (await _authService.user).uid);
    result.fold(
      (error) => _error = error,
      (likeStatus) => _isLiked = likeStatus,
    );
    _isLoading = false;
  }
}
