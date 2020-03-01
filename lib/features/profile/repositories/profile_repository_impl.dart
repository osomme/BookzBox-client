import 'package:bookzbox/features/profile/models/mem_cache.dart';
import 'package:bookzbox/features/profile/models/profile.dart';
import 'package:bookzbox/features/profile/repositories/profile_repository.dart';
import 'package:bookzbox/features/profile/services/profile_service.dart';
import 'package:dartz/dartz.dart';

class ProfileRepository extends IProfileRepository {
  final IMemCache _myProfileMemCache;
  final IProfileService _profileService;

  ProfileRepository(this._myProfileMemCache, this._profileService);

  @override
  Profile getCachedProfile() {
    return _myProfileMemCache.getCache();
  }

  @override
  bool hasCachedProfile() {
    return _myProfileMemCache.hasCache();
  }

  @override
  Future<Either<String, Profile>> fetch(String userId) async {
    return await _profileService.fetch(userId);
  }
}
