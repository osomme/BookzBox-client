import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/new_box/services/publish_error.dart';
import 'package:dartz/dartz.dart';

abstract class IPublishService {
  static IPublishService instance;

  Future<Either<PublishError, Box>> publish(Box box);
}
