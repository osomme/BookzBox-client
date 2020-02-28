import 'package:bookzbox/features/box/helpers/box_mapper.dart';
import 'package:bookzbox/features/box/models/box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookzbox/features/new_box/services/publish_error.dart';

import 'package:dartz/dartz.dart';

import 'publish_service.dart';

class PublishService extends IPublishService {
  PublishService._privateConstructor();

  static final PublishService instance = PublishService._privateConstructor();

  @override
  Future<Either<PublishError, Box>> publish(Box box) async {
    bool published = false;
    await Firestore.instance
        .collection('boxes')
        .document()
        .setData(BoxMapper.map(box))
        .then((_) => published = true)
        .catchError((_, st) => print(st.toString()));

    return (published ? right(box) : left(PublishError.TimeOut));
  }
}
