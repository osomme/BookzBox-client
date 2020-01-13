import 'package:bookzbox/features/authentication/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseToDomain on FirebaseUser {
  /// Creates a [User] from a [FireBaseUser] object.
  User toDomain() {
    return User(this.uid);
  }
}
