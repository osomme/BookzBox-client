import 'package:bookzbox/common/di/providers.dart';
import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:bookzbox/features/box_details/ui/screens/box_details_screen.dart';
import 'package:bookzbox/features/chat/chat.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/home_screen/ui/screens/home_screen.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:bookzbox/features/location/location.dart';
import 'package:bookzbox/features/match/match.dart';
import 'package:bookzbox/features/profile/repositories/profile_repository.dart';
import 'package:bookzbox/features/profile/stores/preferences_store.dart';
import 'package:bookzbox/features/profile/stores/profile_box_store.dart';
import 'package:bookzbox/features/profile/stores/profile_store.dart';
import 'package:bookzbox/features/profile/ui/screens/profile_screen.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:bookzbox/common/extensions/color_extensions.dart';

import 'features/box/models/box.dart';

void main() async {
  initializeDateFormatting();
  await initHive();
  runApp(MyApp());
}

/// Initializes the local Hive database.
Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BoxStatusAdapter());
  Hive.registerAdapter(BoxFeedBookAdapter());
  Hive.registerAdapter(BoxFeedListItemAdapter());
}

final FirebaseAnalytics _analytics = FirebaseAnalytics();

///The color theme shared by all material widgets.
final _themeData = ThemeData(
  primarySwatch: Color.fromRGBO(58, 46, 58, 1.0).toSwatch(),
  accentColor: Color.fromRGBO(239, 177, 130, 1.0),
  accentColorBrightness: Brightness.light,
  backgroundColor: Colors.grey[300],
  scaffoldBackgroundColor: Colors.grey[300],
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...authProviders,
        ...feedProviders,
        ...mainProviders,
        ...bookProviders,
        ...feedProviders,
        ...commonServicesProviders,
        ...mapProviders,
        ...myProfileProviders,
        ...boxDetailsProviders,
      ],
      child: MaterialApp(
        routes: {
          Screens.authSelect: (ctx) => Provider.of<AuthSelectionScreen>(ctx),
          Screens.emailLogin: (ctx) => MultiProvider(
                providers: loginProviders,
                child: Consumer<LoginScreen>(
                  builder: (_, loginScreen, __) => loginScreen,
                ),
              ),
          Screens.emailNewAccount: (ctx) => MultiProvider(
                providers: loginProviders,
                child: Consumer<CreateAccountScreen>(
                  builder: (_, createAccScreen, __) => createAccScreen,
                ),
              ),
          Screens.home: (ctx) => Provider.of<HomeScreen>(ctx),
        },
        onGenerateRoute: (settings) {
          // If destination route is box details screen:
          if (settings.name == Screens.boxDetails) {
            final String boxId = settings.arguments;
            return MaterialPageRoute(builder: (ctx) {
              return MultiProvider(
                providers: [
                  ...boxDetailsProviders,
                  ...boxLikeProviders,
                  ...commonServicesProviders,
                ],
                child: Consumer<AuthStore>(
                  builder: (ctx, store, __) => BoxDetailsScreen(
                    boxId: boxId,
                    store: Provider.of<BoxDetailsStore>(ctx),
                    likeStore: BoxLikeStore(
                      Provider.of<IBoxLikeRepository>(ctx),
                      Provider.of<IAuthService>(ctx),
                      boxId,
                    ),
                    locationService: Provider.of<ILocationService>(ctx),
                    userId: store.user?.uid,
                  ),
                ),
              );
            });
          } else if (settings.name == Screens.profile) {
            final String userId = settings.arguments;
            return MaterialPageRoute(builder: (ctx) {
              return ProfileScreen(
                profileStore: ProfileStore(Provider.of<IProfileRepository>(ctx), userId),
                authStore: Provider.of<AuthStore>(ctx),
                profileBoxStore: Provider.of<ProfileBoxStore>(ctx),
                preferencesStore: Provider.of<PreferencesStore>(ctx),
              );
            });
          } else if (settings.name == Screens.chat) {
            final ChatScreenArgs args = settings.arguments;
            return MaterialPageRoute(builder: (ctx) {
              return MultiProvider(
                providers: [...chatProviders, ...matchProviders],
                child: Consumer<ChatStore>(
                  builder: (ctx, chatStore, _) => Consumer<MatchStore>(
                    builder: (ctx, matchStore, _) => ChatScreen(
                      matchId: args.chatId,
                      clientUserId: Provider.of<AuthStore>(ctx).user?.uid ?? '',
                      otherUsername: args.otherUserName,
                      chatStore: chatStore,
                      matchStore: matchStore,
                      otherUserThumbnail: args.otherUserThumbnail,
                    ),
                  ),
                ),
              );
            });
          }
        },
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: _analytics),
        ],
        localizationsDelegates: [S.delegate],
        supportedLocales: S.delegate.supportedLocales,
        title: 'BookzBox',
        debugShowCheckedModeBanner: false,
        theme: _themeData,
        home: Consumer<AuthStore>(
          builder: (_, authStore, __) {
            return Observer(
              builder: (ctx) {
                if (authStore.isLoggedIn) {
                  print('User is logged in');
                  return Provider.of<HomeScreen>(ctx);
                } else {
                  print('User is not logged in');
                  return Provider.of<AuthSelectionScreen>(ctx);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
