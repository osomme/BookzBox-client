import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:provider/provider.dart';

final authProviders = [
  Provider<LoginCredentialsStore>(create: (_) => LoginCredentialsStore()),
  Provider<NewAccountStore>(create: (_) => NewAccountStore()),
  Provider<IAuthService>(create: (_) => AuthService.instance),
  ProxyProvider<IAuthService, IAuthRepository>(
      update: (_, service, __) => AuthRepository(service)),
  ProxyProvider<IAuthRepository, AuthStore>(update: (_, repo, __) => AuthStore(repo)),
];
