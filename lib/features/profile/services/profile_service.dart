import 'package:bookzbox/features/profile/models/profile.dart';
import 'package:dartz/dartz.dart';

abstract class IProfileService {
  /// Fetch a profile from an external service for the user with the given userId.
  Future<Either<String, Profile>> fetch(String userId);
}
