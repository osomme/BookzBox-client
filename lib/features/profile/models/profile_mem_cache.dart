import 'package:bookzbox/features/profile/models/mem_cache.dart';
import 'package:bookzbox/features/profile/models/profile.dart';

class ProfileMemCache extends IMemCache<Profile> {
  /// The cached profile.
  static Profile _profile;

  /// Check if there is currently a cached `Profile`.
  @override
  bool hasCache() => _profile != null;

  @override
  Profile getCache() {
    return _profile;
  }

  @override
  void setCache(Profile profile) {
    _profile = profile;
  }
}
