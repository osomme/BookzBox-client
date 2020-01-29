import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  group('Auth store', () {
    IAuthRepository mockRepo = MockAuthRepository();
    AuthStore store = AuthStore(mockRepo);

    setUp(() {
      mockRepo = MockAuthRepository();
      store = AuthStore(mockRepo);
    });

    group('observables', () {
      test('user should be not null after successfully logging in with email', () async {
        expect(store.user, isNull);
        when(mockRepo.signInWithEmail(any, any)).thenAnswer((_) => _successfulLogin());
        await store.signInWithEmail('', '');
        expect(store.user, isNotNull);
      });

      test('user should be not null after successfully logging in with google', () async {
        expect(store.user, isNull);
        when(mockRepo.signInWithGoogle()).thenAnswer((_) => _successfulLogin());
        await store.signInWithGoogle();
        expect(store.user, isNotNull);
      });

      test('logging out should set user to null', () async {
        expect(store.user, isNull);
        when(mockRepo.signInWithGoogle()).thenAnswer((_) => _successfulLogin());
        await store.signInWithGoogle();
        expect(store.user, isNotNull);
        store.logOut();
        expect(store.user, isNull);
      });

      test('errorMessage should not be null when failing to sign in', () async {
        expect(store.errorMessage, isNull);
        when(mockRepo.signInWithGoogle()).thenAnswer((_) => _failedLogin());
        await store.signInWithGoogle();
        expect(store.errorMessage, isNotNull);
      });

      test('errorMessage should not be null when failing register', () async {
        expect(store.errorMessage, isNull);
        when(mockRepo.registerWithEmail(any, any, any)).thenAnswer((_) => _failedLogin());
        await store.registerUser('', '', '');
        expect(store.errorMessage, isNotNull);
      });

      test('errorMessage should be set to null after performing a new action', () async {
        expect(store.errorMessage, isNull);
        when(mockRepo.registerWithEmail(any, any, any)).thenAnswer((_) => _failedLogin());
        await store.registerUser('', '', '');
        expect(store.errorMessage, isNotNull);
        when(mockRepo.signInWithGoogle()).thenAnswer((_) => _successfulLogin());
        await store.signInWithGoogle();
        expect(store.errorMessage, isNull);
      });
    });

    group('computed', () {
      test('isLoggedIn is true when user successfully logs in', () async {
        expect(store.isLoggedIn, isFalse);
        when(mockRepo.signInWithGoogle()).thenAnswer((_) => _successfulLogin());
        await store.signInWithGoogle();
        expect(store.isLoggedIn, isTrue);
      });

      test('isLoggedIn is false when user fails to logs in', () async {
        expect(store.isLoggedIn, isFalse);
        when(mockRepo.signInWithGoogle()).thenAnswer((_) => _failedLogin());
        await store.signInWithGoogle();
        expect(store.isLoggedIn, isFalse);
      });

      test('isLoggedIn is false after user logs out', () async {
        expect(store.isLoggedIn, isFalse);
        when(mockRepo.signInWithGoogle()).thenAnswer((_) => _successfulLogin());
        await store.signInWithGoogle();
        expect(store.isLoggedIn, isTrue);
        store.logOut();
        expect(store.isLoggedIn, isFalse);
      });
    });

    group('actions', () {
      test('registerUser should call repo.registerWithEmail once', () async {
        when(mockRepo.registerWithEmail(any, any, any))
            .thenAnswer((_) => _successfulLogin());
        store.registerUser('', '', '');
        verify(mockRepo.registerWithEmail(any, any, any)).called(1);
      });

      test('signInWithGoogle should call repo.signInWithGoogle once', () async {
        when(mockRepo.signInWithGoogle()).thenAnswer((_) => _successfulLogin());
        store.signInWithGoogle();
        verify(mockRepo.signInWithGoogle()).called(1);
      });

      test('signInWithEmail should call repo.signInWithEmail once', () async {
        when(mockRepo.signInWithEmail(any, any)).thenAnswer((_) => _successfulLogin());
        store.signInWithEmail('', '');
        verify(mockRepo.signInWithEmail(any, any)).called(1);
      });

      test('constructor should call repo.user once', () async {
        // The setup function instanciates the store.
        when(mockRepo.user).thenAnswer((_) => Future.value(User('uid')));
        verify(mockRepo.user).called(1);
      });

      test('clearError should set errorMessage to null', () async {
        when(mockRepo.signInWithGoogle()).thenAnswer((_) => _failedLogin());
        await store.signInWithGoogle();
        expect(store.errorMessage, isNotNull);
        store.clearError();
        expect(store.errorMessage, isNull);
      });
    });
  });
}

/// Returns a successful repository response to fetching a user.
Future<Either<String, User>> _successfulLogin() async => Right(User('abc'));

/// Returns a failed repository response to fetching a user.
Future<Either<String, User>> _failedLogin() async => Left('error');
