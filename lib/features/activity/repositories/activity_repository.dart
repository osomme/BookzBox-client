import 'package:bookzbox/features/activity/activity.dart';

abstract class IActivtiyRepository {
  Future<Stream<Iterable<ActivityItem>>> activityFeed(String userId);
}
