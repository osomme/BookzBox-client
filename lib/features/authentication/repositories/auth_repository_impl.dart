import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

class AuthRepository implements IAuthRepository {
  final IAuthService _service;

  AuthRepository(this._service);

  /// Gets the current user, or null if there is no user logged in.
  @override
  Future<User> get user => _service.user;

  @override
  Future<Either<String, User>> signInWithGoogle() async {
    try {
      final user = await _service.signInWithGoogle();
      return Right(user);
    } catch (e) {
      print(e);
      return Left('Failed to log in'); //TODO: Give actual error message.
    }
  }

  @override
  Future<Either<String, User>> signInWithEmail(String email, String password) async {
    try {
      final user = await _service.signInWithEmail(email, password);
      return Right(user);
    } on PlatformException catch (e) {
      print(e);
      return Left('Failed to log in'); //TODO: Give actual error message.
    }
  }

  @override
  void logOut() => _service.logOut();

  @override
  Future<Either<String, User>> registerWithEmail(
      String email, String password, String username) async {
    try {
      final user = await _service.registerWithEmail(email, password, username);
      return Right(user);
    } catch (e) {
      print(e);
      return Left('Failed to register'); //TODO: Give actual error message.
    }
  }
}
