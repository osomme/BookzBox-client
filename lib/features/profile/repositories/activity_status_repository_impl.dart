import 'package:bookzbox/features/profile/repositories/activity_status_repository.dart';
import 'package:bookzbox/features/profile/services/activity_status_service.dart';

class ActivityStatusRepository extends IActivityStatusRepository {
  final IActivityStatusService activityStatusService;

  ActivityStatusRepository(this.activityStatusService);

  @override
  Future<bool> updateActivityStatus(String userId) async {
    return await activityStatusService.updateActivityStatus(userId);
  }
}
