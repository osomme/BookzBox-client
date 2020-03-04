import 'package:bookzbox/features/profile/models/profile.dart';
import 'package:bookzbox/features/profile/repositories/profile_repository.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  final IProfileRepository _profileRepo;

  @observable
  bool _isMyProfile;

  @observable
  Profile _profile = Profile(
    userId: null,
    displayName: '',
    rating: 0,
    tradeCount: 0,
    joinDate: DateTime.now(),
    lastSeen: DateTime.now(),
    photoUrl: '',
  );

  @observable
  String _userId;

  @observable
  String _profileLoadError = '';

  /// Constructor
  /// [userId] must be null if this is 'my' profile, otherwise
  ///          it should be the user id of the profile to view.
  _ProfileStore(this._profileRepo, String userId) {
    _isMyProfile = userId == null;
    _userId = userId ?? '';

    if (_isMyProfile && _profileRepo.hasCachedProfile()) {
      _profile = _profileRepo.getCachedProfile();
    }
  }

  /// Run once on load.
  @action
  void init() {
    _profileRepo
        .fetch(_userId)
        .then((_) => _.fold((error) => _profileLoadError = error, (profile) => _profile = profile));
  }

  @action
  void setUserId(String uid) => _userId = uid;

  @computed
  Profile get profile => _profile;

  @computed
  bool get isMyProfile => _isMyProfile;

  /// The string is empty or null if there is no error.
  @computed
  String get profileLoadError => _profileLoadError;
}
