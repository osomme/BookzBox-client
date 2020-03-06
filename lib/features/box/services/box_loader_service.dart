import 'package:bookzbox/features/box/models/mini_box.dart';
import 'package:dartz/dartz.dart';

abstract class IBoxLoaderService {
  Future<Either<String, List<MiniBox>>> loadForUser(String userId);

  Future<Either<String, List<MiniBox>>> loadForOtherUser(String userId);

  Future<Stream<Iterable<MiniBox>>> loadUserFavorites(String userId);
}
