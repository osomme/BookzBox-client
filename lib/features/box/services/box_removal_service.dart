/// Interface which contains methods for removing boxes from a web service.
abstract class IBoxRemovalService {
  /// Deletes a box from the database.
  ///
  /// [boxId] The ID of the box that is being removed.
  Future<bool> remove(String boxId);
}
