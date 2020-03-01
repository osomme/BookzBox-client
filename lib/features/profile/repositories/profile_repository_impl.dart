import 'package:bookzbox/features/profile/models/mem_cache.dart';
import 'package:bookzbox/features/profile/models/profile.dart';
import 'package:bookzbox/features/profile/repositories/profile_repository.dart';

class ProfileRepository extends IProfileRepository {
  IMemCache _myProfileMemCache;

  ProfileRepository(IMemCache myProfileMemCache) {
    _myProfileMemCache = myProfileMemCache ?? ArgumentError.notNull('myProfileMemCache');
  }

  @override
  Profile getCachedProfile() {
    return _myProfileMemCache.getCache();
  }

  @override
  bool hasCachedProfile() {
    return _myProfileMemCache.hasCache();
  }
}
