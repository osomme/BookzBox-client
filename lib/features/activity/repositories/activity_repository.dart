import 'package:bookzbox/features/activity/activity.dart';

/// Repository class which contains methods for retrieving and interacting with a stream of activity feed notifications.
abstract class IActivtiyRepository {
  /// Returns a stream containing all the activity items that belong to the userpassed in [userId].
  Future<Stream<Iterable<ActivityItem>>> activityFeed(String userId);

  /// Marks a activity item as read.
  Future<void> markAsRead(String userId, String activityId);

  /// Marks all activites for a user as read.
  Future<void> markAllAsRead(String userId);
}
