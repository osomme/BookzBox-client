import 'package:bookzbox/features/activity/activity.dart';

abstract class IActivtiyService {
  Future<Stream<Iterable<ActivityItem>>> activityFeed(String userId);
}
