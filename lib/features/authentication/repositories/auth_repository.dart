import 'package:bookzbox/features/authentication/models/models.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<String, User>> signInWithGoogle();

  Future<Either<String, User>> signInWithEmail(String email, String password);

  Future<Either<String, User>> registerWithEmail(
      String email, String password, String username);

  Future<User> get user;

  void logOut();
}
