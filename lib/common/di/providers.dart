import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/authentication/errors/auth_error_handling.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:bookzbox/features/box_details/ui/screens/box_details_screen.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/feed/service/box_like_service.dart';
import 'package:bookzbox/features/feed/service/box_like_service_impl.dart';
import 'package:bookzbox/features/home_screen/ui/screens/home_screen.dart';
import 'package:bookzbox/features/location/location.dart';
import 'package:bookzbox/features/location/services/location_service.dart';
import 'package:bookzbox/features/map/box_map.dart';
import 'package:bookzbox/features/new_box/repositories/book_repository.dart';
import 'package:bookzbox/features/new_box/repositories/book_repository_impl.dart';
import 'package:bookzbox/features/new_box/repositories/box_repository.dart';
import 'package:bookzbox/features/new_box/repositories/box_repository_impl.dart';
import 'package:bookzbox/features/new_box/services/book_service.dart';
import 'package:bookzbox/features/new_box/services/book_service_impl.dart';
import 'package:bookzbox/features/new_box/services/publish_service.dart';
import 'package:bookzbox/features/new_box/services/publish_service_impl.dart';
import 'package:bookzbox/features/new_box/stores/new_box_store.dart';
import 'package:bookzbox/features/new_box/ui/screens/new_box_screen.dart';
import 'package:bookzbox/features/profile/stores/profile_store.dart';
import 'package:bookzbox/features/profile/ui/screens/profile_screen.dart';
import 'package:provider/provider.dart';

final authProviders = [
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
];

final loginProviders = [
  Provider<LoginCredentialsStore>(create: (_) => LoginCredentialsStore()),
  Provider<NewAccountStore>(create: (_) => NewAccountStore()),
  ProxyProvider3<AuthStore, LoginCredentialsStore, IAuthErrorParser, LoginScreen>(
    update: (_, authStore, credStore, errorParser, __) =>
        LoginScreen(authStore, credStore, errorParser),
  ),
  ProxyProvider3<AuthStore, NewAccountStore, IAuthErrorParser, CreateAccountScreen>(
    update: (_, authStore, newAccStore, errorParser, __) =>
        CreateAccountScreen(authStore, newAccStore, errorParser),
  ),
];

final bookProviders = [
  Provider<IBookService>(create: (_) => BookService.instance),
  ProxyProvider<IBookService, IBookRepository>(
    update: (_, service, __) => BookRepository(service),
  ),
  Provider<IPublishService>(
    create: (_) => PublishService.instance,
  ),
  ProxyProvider<IPublishService, IBoxRepository>(
    update: (_, service, __) => BoxRepository(service),
  ),
  Provider<ILocationService>(
    create: (_) => LocationService(),
  ),
  ProxyProvider3<IBookRepository, IBoxRepository, ILocationService, NewBoxStore>(
    update: (_, bookRepo, boxRepo, locService, __) => NewBoxStore(bookRepo, boxRepo, locService),
  ),
  ProxyProvider<NewBoxStore, NewBoxScreen>(
    update: (_, store, __) => NewBoxScreen(store),
  )
];

final mainProviders = [
  Provider<HomeScreen>(
    create: (_) => HomeScreen(),
  ),
];

final boxLikeProviders = [
  Provider<IBoxLikeService>(
    create: (_) => FirebaseBoxLikeService(),
  ),
  ProxyProvider<IBoxLikeService, IBoxLikeRepository>(
    update: (_, service, __) => BoxLikeRepository(service),
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
  ...boxLikeProviders,
  ProxyProvider<FeedStore, FeedScreen>(
    update: (_, store, __) => FeedScreen(feedStore: store),
  ),
];

final myProfileProviders = [
  Provider<ProfileStore>(
    create: (_) => ProfileStore(null),
  ),
  ProxyProvider2<ProfileStore, AuthStore, ProfileScreen>(
    update: (_, profileStore, authStore, __) => ProfileScreen(
      profileStore: profileStore,
      authStore: authStore,
    ),
  ),
];

final commonServicesProviders = [
  Provider<ILocationService>(
    create: (_) => LocationService(),
  ),
];

final mapProviders = [
  Provider<IMapBoxService>(
    create: (_) => BoxMapFirebaseService(),
  ),
  ProxyProvider<IMapBoxService, IBoxMapRepository>(
    update: (_, service, __) => BoxMapFirebaseRepository(service),
  ),
  ProxyProvider2<ILocationService, IBoxMapRepository, MapStore>(
    update: (_, locationService, repo, __) => MapStore(locationService, repo),
  ),
  ProxyProvider<MapStore, BoxMapScreen>(
    update: (ctx, store, _) => BoxMapScreen(
      mapStore: store,
    ),
  ),
];

final boxDetailsProviders = [
  Provider<IBoxDetailsService>(
    create: (_) => BoxDetailsFirebaseService(),
  ),
  ProxyProvider<IBoxDetailsService, IBoxDetailsRepository>(
    update: (_, service, __) => BoxDetailsRepository(service),
  ),
  ProxyProvider<IBoxDetailsRepository, BoxDetailsStore>(
    update: (_, repo, __) => BoxDetailsStore(repo),
  ),
];
