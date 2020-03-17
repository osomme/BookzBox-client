import 'package:bookzbox/features/profile/repositories/activity_status_repository.dart';
import 'package:mobx/mobx.dart';

part 'activity_status_store.g.dart';

class ActivityStatusStore = _ActivityStatusStore with _$ActivityStatusStore;

abstract class _ActivityStatusStore with Store {
  final IActivityStatusRepository activityStatusRepo;

  _ActivityStatusStore(this.activityStatusRepo);

  @action
  Future<bool> updateStatus(String userId) async {
    if (userId == null) {
      return false;
    }
    return await activityStatusRepo.updateActivityStatus(userId);
  }
}
