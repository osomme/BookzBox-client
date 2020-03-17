abstract class IActivityStatusService {
  /// Update the activity status or last seen time for the user with the passed userId.
  ///
  /// [userId] The id of the user of whom to update the activity status for,
  /// Returns a bool representing success (true) or failure (false).
  Future<bool> updateActivityStatus(String userId);
}
