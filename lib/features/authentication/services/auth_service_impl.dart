import 'package:bookzbox/features/authentication/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './services.dart';

class AuthService implements IAuthService {
  final _auth = FirebaseAuth.instance;
  final _db = Firestore.instance;
  final _googleSignIn = GoogleSignIn();

  AuthService._privateConstructor();

  static final AuthService instance = AuthService._privateConstructor();

  @override
  Future<Either<String, User>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return Left('sign_in_canceled');
      }
      final googleAuth = await googleUser.authentication;
      final credentials = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final user = (await _auth.signInWithCredential(credentials)).user;
      final isAlreadyInDb = await _isAlreadyInDb(user.uid);
      if (isAlreadyInDb) {
        await _updateLastSeen(user.uid);
      } else {
        await _setUserData(user, user.displayName);
      }
      return Right(user.toDomain());
    } on PlatformException catch (e) {
      print(e);
      return Left(e.code);
    }
  }

  @override
  Future<Either<String, User>> signInWithEmail(String email, String password) async {
    try {
      final user =
          (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
      await _updateLastSeen(user.uid);
      return Right(user.toDomain());
    } on PlatformException catch (e) {
      print(e);
      return Left(e.code);
    }
  }

  @override
  Future<Either<String, User>> registerWithEmail(
      String email, String password, String username) async {
    try {
      final user =
          (await _auth.createUserWithEmailAndPassword(email: email, password: password))
              .user;
      await _setUserData(user, username);
      return Right(user.toDomain());
    } on PlatformException catch (e) {
      print(e);
      return Left(e.code);
    }
  }

  Future<void> _updateLastSeen(String userId) async {
    final ref = _db.collection('users').document(userId);
    await ref.setData({'lastSeen': FieldValue.serverTimestamp()}, merge: true);
  }

  Future<void> _setUserData(FirebaseUser user, String username) async {
    final ref = _db.collection('users').document(user.uid);

    await ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoUrl,
      'displayName': username,
      'registeredOn': FieldValue.serverTimestamp(),
      'lastSeen': FieldValue.serverTimestamp(),
    });
  }

  Future<bool> _isAlreadyInDb(String userId) async {
    final doc = await _db.collection('users').document(userId).get();
    return doc.exists;
  }

  @override
  void logOut() => _auth.signOut();

  @override
  Future<User> get user async =>
      _auth.currentUser().then((user) => user?.toDomain() ?? null);
}
