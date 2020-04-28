import 'package:bookzbox/features/profile/models/profile.dart';
import 'package:dartz/dartz.dart';

abstract class IProfileRepository {
  /// Returns `true` if the cache has a profile; otherwise `false`.
  bool hasCachedProfile();

  Profile getCachedProfile();

  /// Update the cache with the given `Profile`.
  ///
  /// [profile] The profile to cache.
  void setCachedProfile(Profile profile);

  /// Fetch the profile for the user with the passed userId.
  ///
  /// Returns either an error as a `String` or the fetched `Profile`.
  Future<Either<String, Profile>> fetch(String userId);
}
