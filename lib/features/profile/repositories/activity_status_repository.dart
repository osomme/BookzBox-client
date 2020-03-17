abstract class IActivityStatusRepository {
  /// Update the activity status or last seen time for the user with the passed userId.
  ///
  /// [userId] The id of the user of whom to update the activity status for,
  Future<bool> updateActivityStatus(String userId);
}
