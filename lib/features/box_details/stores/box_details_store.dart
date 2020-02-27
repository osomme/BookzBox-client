import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:mobx/mobx.dart';

part 'box_details_store.g.dart';

class BoxDetailsStore = _BoxDetailsStore with _$BoxDetailsStore;

abstract class _BoxDetailsStore with Store {
  final IBoxDetailsRepository _repo;

  @observable
  bool _isLoading = false;

  @observable
  Box _box;

  @observable
  BoxDetailsError _error;

  _BoxDetailsStore(this._repo);

  @computed
  bool get isLoading => _isLoading;

  @computed
  Box get box => _box;

  @computed
  BoxDetailsError get error => _error;

  @action
  Future<void> fetchBoxDetails(String boxId) async {
    _isLoading = true;
    _error = null;
    final results = await _repo.getBox(boxId);
    results.fold(
      (error) => _error = error,
      (box) => _box = box,
    );
    _isLoading = false;
  }
}
