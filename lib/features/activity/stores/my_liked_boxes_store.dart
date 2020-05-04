import 'dart:async';

import 'package:bookzbox/features/box/box.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:mobx/mobx.dart';

part 'my_liked_boxes_store.g.dart';

class MyLikedBoxesStore = _MyLikedBoxesStore with _$MyLikedBoxesStore;

abstract class _MyLikedBoxesStore with Store {
  final IBoxLoaderRepository _boxLoaderRepository;
  final IBoxLikeRepository _likeRepository;

  StreamSubscription<Iterable<MiniBox>> _streamSubscription;

  String _userId;

  @observable
  bool _isLoading = false;

  @observable
  bool _hasError = false;

  @observable
  List<MiniBox> _boxes;

  _MyLikedBoxesStore(this._boxLoaderRepository, this._likeRepository);

  @computed
  bool get isLoading => _isLoading;

  @computed
  bool get hasError => _hasError;

  @computed
  List<MiniBox> get boxes => _boxes;

  Future<void> fetchBoxes(String userId) async {
    _userId = userId;
    _isLoading = true;
    final boxStream = await _boxLoaderRepository.loadUserFavorites(userId);
    _streamSubscription = boxStream.listen(
      (data) {
        if (isLoading) {
          _isLoading = false;
        }
        if (hasError) {
          _hasError = false;
        }
        _boxes = data.toList();
      },
      onError: (error) {
        print('Error while listening to liked box stream with user id: $userId');
        _hasError = true;
      },
    );
  }

  @action
  Future<void> removeLike(String boxId) async {
    if (_userId == null) {
      print('Attempted to remove like when user ID was null in "my_liked_boxes_store"');
      return;
    }
    if (_isLoading) {
      // Do not allow removing a box if another box removal function is running.
      return;
    }
    _isLoading = true;
    final results = await _likeRepository.removeLike(boxId, _userId);
    results.fold(
      (error) => print('Failed to remove like from $boxId'),
      (success) {
        // Due to the fact that removing a like removes it from a different collection which then triggers a
        // cloud function, it is a better user experience to instantly remove it from the client data. This prevents
        // a situation where the user pressed the remove button, and the box is deleted from DB but it is still
        // visible in the UI.
        _boxes = _boxes.where((b) => b.id != boxId).toList();
        print('Removed like from $boxId');
      },
    );
    _isLoading = false;
  }

  void dispose() {
    _streamSubscription?.cancel();
  }
}
