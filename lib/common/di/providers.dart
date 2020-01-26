import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/authentication/errors/auth_error_handling.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/feed/service/box_like_service.dart';
import 'package:bookzbox/features/feed/service/box_like_service_impl.dart';
import 'package:bookzbox/features/home_screen/ui/screens/home_screen.dart';
import 'package:bookzbox/features/location/location.dart';
import 'package:bookzbox/features/location/services/location_service.dart';
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
  Provider<HomeScreen>(
    create: (_) => HomeScreen(),
  ),
];

final feedProviders = [
  Provider<IFeedService>(
    create: (_) => FirebaseFeedService(),
  ),
  ProxyProvider<IFeedService, IFeedRepository>(
    update: (_, service, __) => FeedRepository(service),
  ),
  ProxyProvider<IFeedRepository, FeedStore>(
    update: (_, repo, __) => FeedStore(repo),
  ),
  Provider<IBoxLikeService>(
    create: (_) => FirebaseBoxLikeService(),
  ),
  ProxyProvider<IBoxLikeService, IBoxLikeRepository>(
    update: (_, service, __) => BoxLikeRepository(service),
  ),
  ProxyProvider<FeedStore, FeedScreen>(
    update: (_, store, __) => FeedScreen(feedStore: store),
  ),
];

final commonServicesProviders = [
  Provider<ILocationService>(
    create: (_) => LocationService(),
  ),
];
