import 'package:bookzbox/features/activity/activity.dart';

/// Service class which can retrieve a stream of activity feed notifications and provides methods for interacting with the stream.
abstract class IActivtiyService {
  /// Returns a stream containing all the activity items that belong to the userpassed in [userId].
  Future<Stream<Iterable<ActivityItem>>> activityFeed(String userId);

  /// Marks a activity item as read.
  Future<void> markAsRead(String userId, String activityId);

  /// Marks all activities for a user as read.
  Future<void> markAllAsRead(String userId);
}
