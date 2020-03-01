import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/box/models/my_box.dart';
import 'package:bookzbox/features/box/services/box_loader_service.dart';
import 'package:bookzbox/features/new_box/services/publish_error.dart';
import 'package:bookzbox/features/new_box/services/publish_service.dart';
import 'package:dartz/dartz.dart';

import 'box_repository.dart';

class BoxRepository extends IBoxRepository {
  final IPublishService _publishService;
  final IBoxLoaderService _boxLoaderService;

  BoxRepository(this._publishService, this._boxLoaderService);

  @override
  Future<Either<PublishError, Box>> publish(Box box) async => await _publishService.publish(box);

  @override
  Future<Either<String, List<MyBox>>> fetchUserBoxes(String userId) async =>
      await _boxLoaderService.loadForUser(userId);
}
