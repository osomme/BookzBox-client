import 'package:bookzbox/features/profile/repositories/activity_status_repository.dart';
import 'package:mobx/mobx.dart';

part 'activity_status_store.g.dart';

class ActivityStatusStore = _ActivityStatusStore with _$ActivityStatusStore;

abstract class _ActivityStatusStore with Store {
  final IActivityStatusRepository activityStatusRepo;

  _ActivityStatusStore(this.activityStatusRepo);

  /// Update the activity status for a user as the user is now active.
  ///
  /// [userId] The id of the user of whom to update the activity status for.
  /// If this is `null`, then a update will not occur.
  @action
  Future<bool> updateStatus(String userId) async {
    if (userId == null) {
      return false;
    }
    return await activityStatusRepo.updateActivityStatus(userId);
  }
}
