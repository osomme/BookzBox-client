import 'package:bookzbox/features/authentication/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthService {
  static IAuthService instance;

  Future<User> get user;

  Future<User> signInWithGoogle();

  Future<User> signInWithEmail(String email, String password);

  Future<User> registerWithEmail(String email, String password, String username);

  Future<void> setUserData(FirebaseUser user);

  void logOut();
}
