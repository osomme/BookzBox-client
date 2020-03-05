import 'dart:async';

import 'package:bookzbox/features/box/box.dart';
import 'package:mobx/mobx.dart';

part 'my_liked_boxes_store.g.dart';

class MyLikedBoxesStore = _MyLikedBoxesStore with _$MyLikedBoxesStore;

abstract class _MyLikedBoxesStore with Store {
  final IBoxLoaderRepository _boxLoaderRepository;

  StreamSubscription<Iterable<MiniBox>> _streamSubscription;

  @observable
  bool _isLoading = false;

  @observable
  bool _hasError = false;

  @observable
  List<MiniBox> _boxes;

  _MyLikedBoxesStore(this._boxLoaderRepository);

  @computed
  bool get isLoading => _isLoading;

  @computed
  bool get hasError => _hasError;

  @computed
  List<MiniBox> get boxes => _boxes;

  Future<void> fetchBoxes(String userId) async {
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

  void dispose() {
    _streamSubscription.cancel();
  }
}
