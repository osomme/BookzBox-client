import 'package:bookzbox/common/ui/screens/home_screen.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/authentication/errors/auth_error_handling.dart';
import 'package:provider/provider.dart';

final authProviders = [
  Provider<LoginCredentialsStore>(create: (_) => LoginCredentialsStore()),
  Provider<NewAccountStore>(create: (_) => NewAccountStore()),
  Provider<IAuthErrorParser>(create: (_) => FirebaseErrorParser()),
  Provider<IAuthService>(create: (_) => AuthService.instance),
  ProxyProvider<IAuthService, IAuthRepository>(
    update: (_, service, __) => AuthRepository(service),
  ),
  ProxyProvider<IAuthRepository, AuthStore>(
    update: (_, repo, __) => AuthStore(repo),
  ),
  ProxyProvider2<AuthStore, IAuthErrorParser, AuthSelectionScreen>(
    update: (_, store, errorParser, __) => AuthSelectionScreen(
      authStore: store,
      errorParser: errorParser,
    ),
  ),
  ProxyProvider3<AuthStore, LoginCredentialsStore, IAuthErrorParser, LoginScreen>(
    update: (_, authStore, credStore, errorParser, __) =>
        LoginScreen(authStore, credStore, errorParser),
  ),
  ProxyProvider3<AuthStore, NewAccountStore, IAuthErrorParser, CreateAccountScreen>(
    update: (_, authStore, newAccStore, errorParser, __) =>
        CreateAccountScreen(authStore, newAccStore, errorParser),
  ),
];

final mainProviders = [
  ProxyProvider<AuthStore, HomeScreen>(
    update: (_, authStore, __) => HomeScreen(authStore),
  ),
];
