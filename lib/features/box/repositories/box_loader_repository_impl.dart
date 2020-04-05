import 'package:bookzbox/features/box/models/mini_box.dart';
import 'package:bookzbox/features/box/box.dart';
import 'package:dartz/dartz.dart';

class BoxLoaderRepository implements IBoxLoaderRepository {
  final IBoxLoaderService _boxLoaderService;

  BoxLoaderRepository(this._boxLoaderService);

  @override
  Future<Either<String, List<MiniBox>>> loadForUser(String userId) async =>
      await _boxLoaderService.loadForUser(userId);

  @override
  Future<Stream<Iterable<MiniBox>>> loadUserFavorites(String userId) async =>
      await _boxLoaderService.loadUserFavorites(userId);
}
