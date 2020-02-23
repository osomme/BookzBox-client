import 'package:bookzbox/features/profile/models/profile.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  @observable
  Profile profile = Profile(rating: 340, tradeCount: 15, joinDate: DateTime.now());
}
