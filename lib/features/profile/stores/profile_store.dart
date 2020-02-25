import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/box/models/my_box.dart';
import 'package:bookzbox/features/profile/models/profile.dart';
import 'package:bookzbox/features/profile/ui/widgets/my_box_list_item.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  @observable
  ObservableList<MyBox> myBoxes = new ObservableList();

  @observable
  Profile profile = Profile(rating: 340, tradeCount: 15, joinDate: DateTime.now());

  /// The box status of the currently focused box.
  @observable
  BoxStatus _currentBoxStatus = BoxStatus.public;

  _ProfileStore() {
    myBoxes.add(
      MyBox(
        id: 'abc',
        status: BoxStatus.public,
        publishDateTime: DateTime.now(),
        title: 'All my Harry Potter books',
        bookThumbnailUrl: null,
      ),
    );
  }

  @computed
  BoxStatus get currentBoxStatus => _currentBoxStatus;

  @action
  void setCurrentBoxStatus(BoxStatus status) => _currentBoxStatus = status;
}
