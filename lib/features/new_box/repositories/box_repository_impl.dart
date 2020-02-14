import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/new_box/services/publish_error.dart';
import 'package:bookzbox/features/new_box/services/publish_service.dart';
import 'package:dartz/dartz.dart';

import 'box_repository.dart';

class BoxRepository extends IBoxRepository {
  final IPublishService _service;

  BoxRepository(this._service);

  @override
  Future<Either<PublishError, Box>> publish(Box box) => _service.publish(box);
}
