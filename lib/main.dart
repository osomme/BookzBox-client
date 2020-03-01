import 'package:bookzbox/common/di/providers.dart';
import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:bookzbox/features/box_details/ui/screens/box_details_screen.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/feed/stores/box_like_store.dart';
import 'package:bookzbox/features/home_screen/ui/screens/home_screen.dart';
import 'package:bookzbox/features/location/location.dart';
import 'package:bookzbox/features/profile/models/profile.dart';
import 'package:bookzbox/features/profile/repositories/profile_repository.dart';
import 'package:bookzbox/features/profile/stores/profile_box_store.dart';
import 'package:bookzbox/features/profile/stores/profile_store.dart';
import 'package:bookzbox/features/profile/ui/screens/profile_screen.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:bookzbox/common/extensions/color_extensions.dart';

void main() {
  initializeDateFormatting();
  runApp(MyApp());
}

final FirebaseAnalytics _analytics = FirebaseAnalytics();

final _themeData = ThemeData(
  primarySwatch: Color.fromRGBO(58, 46, 58, 1.0).toSwatch(),
  accentColor: Color.fromRGBO(239, 177, 130, 1.0),
  accentColorBrightness: Brightness.light,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...authProviders,
        ...mainProviders,
        ...bookProviders,
        ...feedProviders,
        ...commonServicesProviders,
        ...mapProviders,
        ...myProfileProviders,
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
                child: Consumer<BoxDetailsStore>(
                  builder: (ctx, store, __) => BoxDetailsScreen(
                    boxId: boxId,
                    store: store,
                    likeStore: BoxLikeStore(
                      Provider.of<IBoxLikeRepository>(ctx),
                      Provider.of<IAuthService>(ctx),
                      boxId,
                    ),
                    locationService: Provider.of<ILocationService>(ctx),
                  ),
                ),
              );
            });
          } else if (settings.name == Screens.profile) {
            final String userId = settings.arguments;
            return MaterialPageRoute(builder: (ctx) {
              return MultiProvider(
                providers: [
                  ProxyProvider<IProfileRepository, ProfileStore>(
                    update: (_, repo, __) => ProfileStore(repo, userId),
                  ),
                ],
                child: Consumer<ProfileScreen>(
                  builder: (ctx, screen, __) => ProfileScreen(
                    profileStore: Provider.of<ProfileStore>(ctx),
                    authStore: Provider.of<AuthStore>(ctx),
                    profileBoxStore: Provider.of<ProfileBoxStore>(ctx),
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
