import 'package:bookzbox/common/ui/screens/home_screen.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:provider/provider.dart';

final authProviders = [
  Provider<LoginCredentialsStore>(create: (_) => LoginCredentialsStore()),
  Provider<NewAccountStore>(create: (_) => NewAccountStore()),
  Provider<IAuthService>(create: (_) => AuthService.instance),
  ProxyProvider<IAuthService, IAuthRepository>(
    update: (_, service, __) => AuthRepository(service),
  ),
  ProxyProvider<IAuthRepository, AuthStore>(
    update: (_, repo, __) => AuthStore(repo),
  ),
  ProxyProvider<AuthStore, AuthSelectionScreen>(
    update: (_, store, __) => AuthSelectionScreen(authStore: store),
  ),
  ProxyProvider2<AuthStore, LoginCredentialsStore, LoginScreen>(
    update: (_, authStore, credStore, __) => LoginScreen(authStore, credStore),
  ),
  ProxyProvider2<AuthStore, NewAccountStore, CreateAccountScreen>(
    update: (_, authStore, newAccStore, __) =>
        CreateAccountScreen(authStore, newAccStore),
  ),
];

final mainProviders = [
  ProxyProvider<AuthStore, HomeScreen>(
    update: (_, authStore, __) => HomeScreen(authStore),
  ),
];
