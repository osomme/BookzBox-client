import 'package:bookzbox/features/box/models/mini_box.dart';
import 'package:dartz/dartz.dart';

abstract class IBoxLoaderRepository {
  /// Loads all boxes for the user with id equal to [userId].
  ///
  /// Returns a list of minimized boxes (`MiniBox`) on success
  /// and an error string on failure.
  Future<Either<String, List<MiniBox>>> loadForUser(String userId);

  Future<Stream<Iterable<MiniBox>>> loadUserFavorites(String userId);
}
