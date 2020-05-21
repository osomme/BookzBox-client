import 'package:bookzbox/features/box/models/mini_box.dart';
import 'package:dartz/dartz.dart';

abstract class IBoxLoaderService {
  /// Fetch all boxes for the user with id equal to [userId].
  /// This function attempts to load private boxes. The [userId]
  /// must therefore match that of the authenticated user.
  ///
  /// [userId] The ID of the user whose boxes are being loaded.
  Future<Either<String, List<MiniBox>>> loadForUser(String userId);

  /// Only loads boxes with PUBLIC status as these are loaded by a user
  /// that does not own the boxes.
  ///
  /// [userId] The ID of the user whose boxes are being loaded.
  Future<Either<String, List<MiniBox>>> loadForOtherUser(String userId);

  /// Loads the liked boxes of a particular user.
  ///
  /// [userId] The ID of the user whose liked boxes are being loaded.
  Future<Stream<Iterable<MiniBox>>> loadUserFavorites(String userId);
}
