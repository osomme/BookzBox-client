import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:mobx/mobx.dart';

part 'box_details_store.g.dart';

/// Store which contains reactive properties and methods for loading a specific box.
class BoxDetailsStore = _BoxDetailsStore with _$BoxDetailsStore;

abstract class _BoxDetailsStore with Store {
  final IBoxDetailsRepository _repo;

  @observable
  bool _isLoading = false;

  @observable
  Box _box;

  @observable
  BoxDetailsError _error;

  /// Constructor which takes a [IBoxDetailsRepository] as its parameter.
  _BoxDetailsStore(this._repo);

  /// Whether the store is currently loading a box.
  @computed
  bool get isLoading => _isLoading;

  /// The loaded box. Is null if the box has not been loaded yet.
  @computed
  Box get box => _box;

  /// An box loading error. Is null if there is no error.
  @computed
  BoxDetailsError get error => _error;

  /// Get the box with id equal to [boxId]. If the action is successfull,
  /// then [box] is updated with the fetched `Box`; otherwise [error]
  /// is updated with the resulting error.
  ///
  /// [boxId] The ID of the box that is being loaded.
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
