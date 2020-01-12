import 'package:bookzbox/features/authentication/models/models.dart';

abstract class IAuthService {
  static IAuthService instance;

  Future<User> get user;

  Future<User> signInWithGoogle();

  Future<User> signInWithEmail(String email, String password);

  Future<User> registerWithEmail(String email, String password, String username);

  void logOut();
}
