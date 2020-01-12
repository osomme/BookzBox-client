import 'package:bookzbox/features/authentication/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './services.dart';

class AuthService implements IAuthService {
  final _auth = FirebaseAuth.instance;
  final _db = Firestore.instance;
  final _googleSignIn = GoogleSignIn();

  AuthService._privateConstructor();

  static final instance = AuthService._privateConstructor();

  @override
  Future<User> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
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
    return user.toDomain();
  }

  @override
  Future<User> signInWithEmail(String email, String password) async {
    final user =
        (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
    await _updateLastSeen(user.uid);
    return user.toDomain();
  }

  @override
  Future<User> registerWithEmail(String email, String password, String username) async {
    final user =
        (await _auth.createUserWithEmailAndPassword(email: email, password: password))
            .user;
    await _setUserData(user, username);
    return user.toDomain();
  }

  Future<void> _updateLastSeen(String userId) async {
    final ref = _db.collection('users').document(userId);
    await ref.setData({'lastSeen': DateTime.now()}, merge: true);
  }

  Future<void> _setUserData(FirebaseUser user, String username) async {
    final ref = _db.collection('users').document(user.uid);

    await ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoUrl,
      'displayName': username,
      'registeredOn': DateTime.now(),
      'lastSeen': DateTime.now()
    });
  }

  Future<bool> _isAlreadyInDb(String userId) async {
    final ref = _db.collection('users').document(userId);
    final doc = await ref.get();
    return doc.exists;
  }

  @override
  void logOut() => _auth.signOut();

  @override
  Future<User> get user async =>
      _auth.currentUser().then((user) => user?.toDomain() ?? null);
}
