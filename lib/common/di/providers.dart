import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/features/activity/stores/my_liked_boxes_store.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/authentication/errors/auth_error_handling.dart';
import 'package:bookzbox/features/box/box.dart';
import 'package:bookzbox/features/box/services/box_loader_service.dart';
import 'package:bookzbox/features/box/services/box_loader_service_impl.dart';
import 'package:bookzbox/features/box/services/box_removal_service.dart';
import 'package:bookzbox/features/box/services/box_removal_service_impl.dart';
import 'package:bookzbox/features/box/services/box_updater_service.dart';
import 'package:bookzbox/features/box/services/box_updater_service_impl.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:bookzbox/features/chat/chat.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/home_screen/ui/screens/home_screen.dart';
import 'package:bookzbox/features/likes/likes.dart';
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
import 'package:bookzbox/features/profile/models/mem_cache.dart';
import 'package:bookzbox/features/profile/models/profile_mem_cache.dart';
import 'package:bookzbox/features/profile/repositories/activity_status_repository.dart';
import 'package:bookzbox/features/profile/repositories/activity_status_repository_impl.dart';
import 'package:bookzbox/features/profile/repositories/preferences_repository.dart';
import 'package:bookzbox/features/profile/repositories/preferences_repository_impl.dart';
import 'package:bookzbox/features/profile/repositories/profile_repository.dart';
import 'package:bookzbox/features/profile/repositories/profile_repository_impl.dart';
import 'package:bookzbox/features/profile/services/activit_status_service_impl.dart';
import 'package:bookzbox/features/profile/services/activity_status_service.dart';
import 'package:bookzbox/features/profile/services/preferences_service.dart';
import 'package:bookzbox/features/profile/services/preferences_service_impl.dart';
import 'package:bookzbox/features/profile/services/profile_service.dart';
import 'package:bookzbox/features/profile/services/profile_service_impl.dart';
import 'package:bookzbox/features/profile/stores/activity_status_store.dart';
import 'package:bookzbox/features/profile/stores/preferences_store.dart';
import 'package:bookzbox/features/profile/stores/profile_box_store.dart';
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

final activityFeedProviders = [
  Provider<IActivtiyService>(
    create: (_) => FirebaseActivtiyService(),
  ),
  ProxyProvider<IActivtiyService, IActivtiyRepository>(
    update: (_, service, __) => ActivityRepositoryImpl(service),
  ),
  ProxyProvider<IActivtiyRepository, ActivityFeedStore>(
    update: (_, repo, __) => ActivityFeedStore(repo),
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
  ...boxDetailsProviders,
  Provider<IBookService>(create: (_) => BookService.instance),
  Provider<IBoxLoaderService>(create: (_) => BoxLoaderService()),
  ProxyProvider<IBookService, IBookRepository>(
    update: (_, service, __) => BookRepository(service),
  ),
  Provider<IPublishService>(
    create: (_) => PublishService.instance,
  ),
  Provider<IBoxUpdaterService>(
    create: (_) => BoxUpdaterService(),
  ),
  Provider<IBoxRemovalService>(
    create: (_) => BoxRemovalService(),
  ),
  ProxyProvider5<IPublishService, IBoxLoaderService, IBoxDetailsService, IBoxUpdaterService,
      IBoxRemovalService, IBoxRepository>(
    update: (_, publishService, boxLoaderService, detailsService, updaterService, boxRemovalService,
            __) =>
        BoxRepository(
            publishService, boxLoaderService, detailsService, updaterService, boxRemovalService),
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

final activityStatusProviders = [
  Provider<IActivityStatusService>(
    create: (_) => ActivityStatusService(),
  ),
  ProxyProvider<IActivityStatusService, IActivityStatusRepository>(
    update: (_, service, __) => ActivityStatusRepository(service),
  ),
  ProxyProvider<IActivityStatusRepository, ActivityStatusStore>(
    update: (_, repo, __) => ActivityStatusStore(repo),
  ),
];

final mainProviders = [
  ...activityFeedProviders,
  ...activityStatusProviders,
  ProxyProvider3<AuthStore, ActivityFeedStore, ActivityStatusStore, HomeScreen>(
    update: (_, authStore, feedStore, activityStatusStore, __) => HomeScreen(
      activityFeedStore: feedStore,
      authStore: authStore,
      activityStatusStore: activityStatusStore,
    ),
  ),
];

final boxLikeProviders = [
  Provider<IBoxLikeService>(
    create: (_) => FirebaseBoxLikeService.instance,
  ),
  ProxyProvider<IBoxLikeService, IBoxLikeRepository>(
    update: (_, service, __) => BoxLikeRepository(service),
  ),
];

final feedProviders = [
  Provider<ILocationService>(
    create: (_) => LocationService(),
  ),
  Provider<IFeedService>(
    create: (_) => FirebaseFeedService(),
  ),
  ProxyProvider<IFeedService, IFeedRepository>(
    update: (_, service, __) => FeedRepository(service),
  ),
  ProxyProvider2<IFeedRepository, ILocationService, FeedStore>(
    update: (_, repo, locService, __) => FeedStore(repo, locService),
  ),
  ...boxLikeProviders,
  ProxyProvider<FeedStore, FeedScreen>(
    update: (_, store, __) => FeedScreen(feedStore: store),
  ),
];

final myProfileProviders = [
  Provider<IMemCache>(
    create: (_) => ProfileMemCache(),
  ),
  Provider<IProfileService>(
    create: (_) => ProfileService(),
  ),
  Provider<IPreferencesService>(
    create: (_) => PreferencesService(),
  ),
  ProxyProvider<IPreferencesService, IPreferencesRepository>(
    update: (_, service, __) => PreferencesRepository(service),
  ),
  ProxyProvider<IPreferencesRepository, PreferencesStore>(
    update: (_, repo, __) => PreferencesStore(repo),
  ),
  ProxyProvider2<IMemCache, IProfileService, IProfileRepository>(
    update: (_, cache, profileService, __) => ProfileRepository(
      cache,
      profileService,
    ),
  ),
  ProxyProvider<IProfileRepository, ProfileStore>(
    update: (_, repo, __) => ProfileStore(repo, null),
  ),
  ProxyProvider<IBoxRepository, ProfileBoxStore>(
    update: (_, repo, __) => ProfileBoxStore(repo),
  ),
  ProxyProvider4<ProfileStore, AuthStore, ProfileBoxStore, PreferencesStore, ProfileScreen>(
    update: (_, profileStore, authStore, profileBoxStore, preferencesStore, __) => ProfileScreen(
      profileStore: profileStore,
      authStore: authStore,
      profileBoxStore: profileBoxStore,
      preferencesStore: preferencesStore,
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

final boxLoaderProviders = [
  Provider<IBoxLoaderService>(
    create: (_) => BoxLoaderService(),
  ),
  ProxyProvider<IBoxLoaderService, IBoxLoaderRepository>(
    update: (_, service, __) => BoxLoaderRepository(service),
  ),
];

final likedBoxesStore = [
  ProxyProvider<IBoxLoaderRepository, MyLikedBoxesStore>(
    update: (_, repository, __) => MyLikedBoxesStore(repository),
  ),
];

final chatProviders = [
  Provider<IChatService>(create: (_) => FirebaseChatService()),
  Provider<IStorageService>(create: (_) => FirebaseStorageService()),
  ProxyProvider<IChatService, IChatRepository>(
    update: (_, service, __) => ChatRepositoryImpl(service),
  ),
  ProxyProvider3<IChatRepository, ActivityFeedStore, IStorageService, ChatStore>(
    update: (_, repo, feedStore, storageService, __) => ChatStore(repo, feedStore, storageService),
  ),
];
