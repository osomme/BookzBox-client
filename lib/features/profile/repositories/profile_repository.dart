import 'package:bookzbox/features/profile/models/profile.dart';
import 'package:dartz/dartz.dart';

abstract class IProfileRepository {
  bool hasCachedProfile();

  Profile getCachedProfile();

  void setCachedProfile(Profile profile);

  /// Fetch the profile for the user with the passed userId.
  Future<Either<String, Profile>> fetch(String userId);
}
