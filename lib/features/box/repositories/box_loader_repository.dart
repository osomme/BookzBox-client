import 'package:bookzbox/features/box/models/mini_box.dart';
import 'package:dartz/dartz.dart';

abstract class IBoxLoaderRepository {
  Future<Either<String, List<MiniBox>>> loadForUser(String userId);

  Future<Stream<Iterable<MiniBox>>> loadUserFavorites(String userId);
}
