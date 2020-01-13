import 'package:bookzbox/features/authentication/models/models.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthService {
  static IAuthService instance;

  Future<User> get user;

  Future<Either<String, User>> signInWithGoogle();

  Future<Either<String, User>> signInWithEmail(String email, String password);

  Future<Either<String, User>> registerWithEmail(
      String email, String password, String username);

  void logOut();
}
