import 'package:bookzbox/features/box/models/my_box.dart';
import 'package:dartz/dartz.dart';

abstract class IBoxLoaderService {
  Future<Either<String, List<MyBox>>> loadForUser(String userId);
}
