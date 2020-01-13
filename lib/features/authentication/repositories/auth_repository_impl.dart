import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:dartz/dartz.dart';

class AuthRepository implements IAuthRepository {
  final IAuthService _service;

  AuthRepository(this._service);

  /// Gets the current user, or null if there is no user logged in.
  @override
  Future<User> get user => _service.user;

  @override
  Future<Either<String, User>> signInWithGoogle() async => _service.signInWithGoogle();

  @override
  Future<Either<String, User>> signInWithEmail(String email, String password) async =>
      _service.signInWithEmail(email, password);

  @override
  void logOut() => _service.logOut();

  @override
  Future<Either<String, User>> registerWithEmail(
          String email, String password, String username) async =>
      _service.registerWithEmail(email, password, username);
}
