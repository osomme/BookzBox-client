import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/box/models/my_box.dart';
import 'package:bookzbox/features/profile/models/profile.dart';
import 'package:bookzbox/features/profile/repositories/profile_repository.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  IProfileRepository _profileRepo;

  @observable
  ObservableList<MyBox> myBoxes = new ObservableList();

  @observable
  bool _isMyProfile;

  @observable
  Profile _profile = Profile(
    userId: null,
    displayName: 'John443',
    rating: 0,
    tradeCount: 0,
    joinDate: DateTime.now(),
  );

  /// The box status of the currently focused box.
  @observable
  BoxStatus _currentBoxStatus = BoxStatus.public;

  @observable
  String _userId;

  /// Constructor
  /// [userId] must be null if this is 'my' profile, otherwise
  ///          it should be the user id of the profile to view.
  _ProfileStore(IProfileRepository profileRepo, String userId) {
    _profileRepo = profileRepo;
    _isMyProfile = userId == null;
    _userId = userId;

    if (_isMyProfile && _profileRepo.hasCachedProfile()) {
      _profile = _profileRepo.getCachedProfile();
    }

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

  /// Run once on load.
  @action
  void init() {
    // TODO: load profile based on _userId
  }

  @action
  void setUserId(String uid) => _userId = uid;

  @computed
  BoxStatus get currentBoxStatus => _currentBoxStatus;

  @action
  void setCurrentBoxStatus(BoxStatus status) => _currentBoxStatus = status;

  @computed
  Profile get profile => _profile;

  @computed
  bool get isMyProfile => _isMyProfile;
}
