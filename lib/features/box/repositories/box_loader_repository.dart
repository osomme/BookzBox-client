import 'package:bookzbox/features/box/models/mini_box.dart';
import 'package:dartz/dartz.dart';

abstract class IBoxLoaderRepository {
  /// Loads all boxes for the user with id equal to [userId].
  ///
  /// Returns a list of minimized boxes (`MiniBox`) on success
  /// and an error string on failure.
  ///
  /// [userId] The user ID that the boxes are being loaded for.
  Future<Either<String, List<MiniBox>>> loadForUser(String userId);

  /// Loads a stream of the users liked boxes.
  ///
  /// [userId] The ID of the user whose liked boxes are being loaded.
  Future<Stream<Iterable<MiniBox>>> loadUserFavorites(String userId);
}
