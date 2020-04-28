abstract class IActivityStatusRepository {
  /// Update the activity status or last seen time for the user with the passed userId.
  ///
  /// [userId] The id of the user of whom to update the activity status for.
  /// Returns `true` if the  activity status was successfully updated; otherwise `false`.
  Future<bool> updateActivityStatus(String userId);
}
