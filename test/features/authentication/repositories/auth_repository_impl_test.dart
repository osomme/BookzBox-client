import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthService extends Mock implements IAuthService {}

void main() {
  group('Auth repository', () {
    IAuthService mockService = MockAuthService();
    IAuthRepository repo = AuthRepository(mockService);

    setUp(() {
      mockService = MockAuthService();
      repo = AuthRepository(mockService);
    });

    test('Should return user from service', () async {
      final user = User('uid');
      when(mockService.user).thenAnswer((_) => Future.value(user));
      final result = await repo.user;
      expect(result, equals(user));
    });

    test('Should return null from service when user is not logged in', () async {
      when(mockService.user).thenAnswer((_) => Future.value(null));
      final result = await repo.user;
      expect(result, isNull);
    });

    test('logOut should call service.logOut', () async {
      repo.logOut();
      verify(mockService.logOut()).called(1);
    });

    test('Should call service.signInWithGoogle when signInWithGoogle is called', () {
      repo.signInWithGoogle();
      verify(mockService.signInWithGoogle()).called(1);
    });

    test('Should call service.signInWithEmail when signInWithEmail is called', () {
      repo.signInWithEmail('email', 'password');
      verify(mockService.signInWithEmail(any, any)).called(1);
    });

    test('Should call service.registerWithEmail when registerWithEmail is called', () {
      repo.registerWithEmail('email', 'password', 'username');
      verify(mockService.registerWithEmail(any, any, any)).called(1);
    });
  });
}
