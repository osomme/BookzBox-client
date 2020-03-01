import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/box/models/my_box.dart';
import 'package:bookzbox/features/new_box/repositories/box_repository.dart';
import 'package:mobx/mobx.dart';

part 'profile_box_store.g.dart';

class ProfileBoxStore = _ProfileBoxStore with _$ProfileBoxStore;

abstract class _ProfileBoxStore with Store {
  final IBoxRepository _boxRepository;

  @observable
  ObservableList<MyBox> myBoxes = new ObservableList();

  /// The box status of the currently focused box.
  @observable
  BoxStatus _currentBoxStatus = BoxStatus.public;

  _ProfileBoxStore(this._boxRepository) {
    myBoxes.add(
      // TODO remove after backend loading is implemented.
      MyBox(
        id: 'abc',
        status: BoxStatus.public,
        publishDateTime: DateTime.now(),
        title: 'All my Harry Potter books',
        bookThumbnailUrl: null,
      ),
    );
  }

  @action
  void init() {
    // TODO: load boxes
  }

  @computed
  BoxStatus get currentBoxStatus => _currentBoxStatus;

  @action
  void setCurrentBoxStatus(BoxStatus status) => _currentBoxStatus = status;
}
