import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/box/services/box_loader_service.dart';
import 'package:bookzbox/features/box/services/box_updater_service.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:bookzbox/features/box_details/errors/box_details_error.dart';
import 'package:bookzbox/features/new_box/services/publish_error.dart';
import 'package:bookzbox/features/new_box/services/publish_service.dart';
import 'package:dartz/dartz.dart';

import 'box_repository.dart';

class BoxRepository extends IBoxRepository {
  final IPublishService _publishService;
  final IBoxLoaderService _boxLoaderService;
  final IBoxDetailsService _detailsService;
  final IBoxUpdaterService _updaterService;

  BoxRepository(
      this._publishService, this._boxLoaderService, this._detailsService, this._updaterService);

  @override
  Future<Either<PublishError, Box>> publish(Box box) async => await _publishService.publish(box);

  @override
  Future<Either<String, List<MiniBox>>> fetchUserBoxes(String userId) async =>
      await _boxLoaderService.loadForUser(userId);

  @override
  Future<Either<String, List<MiniBox>>> fetchOtherUsersBoxes(String userId) async =>
      await _boxLoaderService.loadForOtherUser(userId);

  @override
  Future<Either<BoxDetailsError, Box>> getBox(String boxId) => _detailsService.getBox(boxId);

  @override
  Future<Either<String, Box>> updateStatus(Box updatedBox) =>
      _updaterService.updateStatus(updatedBox);
}
