import 'package:bookzbox/features/box/models/my_box.dart';
import 'package:bookzbox/features/box/services/box_loader_service.dart';
import 'package:dartz/dartz.dart';

class BoxLoaderService extends IBoxLoaderService {
  @override
  Future<Either<String, List<MyBox>>> loadForUser(String userId) async {
    // TODO: implement loadForUser
    return null;
  }
}
