import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/new_box/repositories/box_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

part 'profile_box_store.g.dart';

class ProfileBoxStore = _ProfileBoxStore with _$ProfileBoxStore;

abstract class _ProfileBoxStore with Store {
  final IBoxRepository _boxRepository;

  @observable
  ObservableList<MiniBox> myBoxes = new ObservableList();

  /// The box status of the currently focused box.
  @observable
  BoxStatus _currentBoxStatus = BoxStatus.public;

  /// [true] if currently fetching boxes, otherwise [false].
  @observable
  bool _isLoading = false;

  _ProfileBoxStore(this._boxRepository);

  @action
  void init(String userId) {
    if (userId == null || userId.isEmpty) {
      return;
    }
    _isLoading = true;
    _boxRepository.fetchUserBoxes(userId).then((result) => handleResult(result));
  }

  @action
  void handleResult(Either<String, List<MiniBox>> res) {
    res.fold((err) => handleFetchError(err), (boxes) => handleFetchSuccess(boxes));
    _isLoading = false;
  }

  @action
  void handleFetchError(String err) {
    print(err);
  }

  @action
  void handleFetchSuccess(List<MiniBox> boxes) {
    myBoxes.clear();
    myBoxes.addAll(boxes);
  }

  @computed
  BoxStatus get currentBoxStatus => _currentBoxStatus;

  @action
  void setCurrentBoxStatus(BoxStatus status) => _currentBoxStatus = status;

  @computed
  bool get isLoading => _isLoading;

  @action
  void setIsLoading(bool isLoading) => _isLoading = isLoading;
}
