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

  @observable
  MiniBox _currentBox;

  /// The box status of the currently focused box.
  @observable
  BoxStatus _currentBoxStatus = BoxStatus.public;

  @observable
  BoxStatus _startBoxStatus = BoxStatus.public;

  /// [true] if currently fetching boxes, otherwise [false].
  @observable
  bool _isLoading = false;

  /// [true] if this is the first change for the current box, otherwise [false].
  @observable
  bool _isFirstVisibilityChange = false;

  @observable
  String _updateError = '';

  /// Are we currently working on removing a box?
  @observable
  bool _isRemovingBox = false;

  _ProfileBoxStore(this._boxRepository);

  @action
  void init(String userId, bool myProfile) {
    if (userId == null || userId.isEmpty) {
      return;
    }
    _isLoading = true;
    if (myProfile) {
      _boxRepository.fetchUserBoxes(userId).then((result) => handleResult(result));
    } else {
      _boxRepository.fetchOtherUsersBoxes(userId).then((result) => handleResult(result));
    }
  }

  @action
  void handleResult(Either<String, List<MiniBox>> res) {
    res.fold(
      (err) => handleFetchError(err),
      (boxes) => handleFetchSuccess(boxes),
    );
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

  /// Updates the currently focused box [_currentBox] with the status
  /// represented by [_currentBoxStatus].
  @action
  Future updateBoxVisibility() async {
    if (_startBoxStatus == _currentBoxStatus) {
      // Don't update as there is no change.
      return;
    }
    _currentBox.status = _currentBoxStatus;
    final fullBoxRes = await _boxRepository.getBox(_currentBox.id);
    fullBoxRes.fold(
      (err) => print(err),
      (box) async {
        box.status = _currentBoxStatus;
        final updateRes = await _boxRepository.updateStatus(box);
        handleUpdateRes(updateRes);
      },
    );
  }

  @action
  void handleUpdateRes(Either<String, Box> res) {
    res.fold(
      (err) {
        print(err);
        _updateError = err;
      },
      (box) => print("Update success!"),
    );
  }

  @action
  Future deleteBox(int index) async {
    _isRemovingBox = true;
    final boxToDelete = myBoxes[index];
    bool success = await _boxRepository.deleteBox(boxToDelete.id);
    if (success) {
      myBoxes.removeAt(index);
    }
    _isRemovingBox = false;
  }

  @computed
  BoxStatus get currentBoxStatus => _currentBoxStatus;

  @action
  void setCurrentBoxStatus(BoxStatus status) => _currentBoxStatus = status;

  @computed
  bool get isLoading => _isLoading;

  @action
  void setIsLoading(bool isLoading) => _isLoading = isLoading;

  @computed
  MiniBox get currentBox => _currentBox;

  @action
  void setCurrentBox(MiniBox box) => _currentBox = box;

  @computed
  bool get isFirstVisibilityChange => _isFirstVisibilityChange;

  @action
  void setIsFirstVisibilityChange(bool isFirstChange) => _isFirstVisibilityChange = isFirstChange;

  @computed
  BoxStatus get startBoxStatus => _startBoxStatus;

  @action
  void setStartBoxStatus(BoxStatus status) => _startBoxStatus = status;

  @computed
  String get updateError => _updateError;

  @action
  void setUpdateError(String err) => _updateError = err;

  @action
  void setBoxStatus(BoxStatus status, int index) {
    myBoxes[index].status = status;
    // Hack to force re-draw.
    var tmpList = myBoxes.toList();
    myBoxes.clear();
    myBoxes.addAll(tmpList);
  }

  @computed
  bool get isRemovingBox => _isRemovingBox;
}
