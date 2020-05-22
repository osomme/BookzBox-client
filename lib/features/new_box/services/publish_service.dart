import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/new_box/services/publish_error.dart';
import 'package:dartz/dartz.dart';

/// Handles publishing of `Box`es.
abstract class IPublishService {
  static IPublishService instance;

  /// Publish the [box].
  ///
  /// Returns either a `PublishError` on failure or the
  /// published box with the generated id.
  Future<Either<PublishError, Box>> publish(Box box);
}
