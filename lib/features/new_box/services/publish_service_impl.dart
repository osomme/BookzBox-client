import 'package:bookzbox/features/box/models/box.dart';

import 'package:bookzbox/features/new_box/services/publish_error.dart';

import 'package:dartz/dartz.dart';

import 'publish_service.dart';

class PublishService extends IPublishService {
  PublishService._privateConstructor();

  static final PublishService instance = PublishService._privateConstructor();

  @override
  Future<Either<PublishError, Box>> publish(Box box) async {
    // TODO: implement publish
    return right(box);
  }
}
