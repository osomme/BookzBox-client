import 'package:bookzbox/features/activity/activity.dart';

class ActivityRepositoryImpl implements IActivtiyRepository {
  final IActivtiyService _service;

  ActivityRepositoryImpl(this._service);

  @override
  Future<Stream<Iterable<ActivityItem>>> activityFeed(String userId) =>
      _service.activityFeed(userId);

  @override
  Future<void> markAsRead(String userId, String activityId) =>
      _service.markAsRead(userId, activityId);

  @override
  Future<void> markAllAsRead(String userId) => _service.markAllAsRead(userId);
}
