import 'package:bookzbox/features/authentication/models/models.dart';
import 'package:dartz/dartz.dart';

/// Repository containing methods related to signing in and out of an authentication provider.
abstract class IAuthRepository {
  /// Signs in with Google as the auth provider. Registers a new account if the Google user does not already have an account.
  Future<Either<String, User>> signInWithGoogle();

  /// Signs in using an email and password combination.
  ///
  /// [email] The email that the user is using to sign in.
  /// [password] The password that the user is using to sign in.
  Future<Either<String, User>> signInWithEmail(String email, String password);

  /// Registers a new user with an email, password and username.
  ///
  /// [email] The email of the user that is registrering.
  /// [password] The password that the user has chosen to register with.
  /// [username] The username of the new user.
  Future<Either<String, User>> registerWithEmail(
      String email, String password, String username);

  /// Returns the currently logged in user. Returns null if the user is not logged in.
  Future<User> get user;

  /// Logs out the currently logged in user.
  void logOut();
}
