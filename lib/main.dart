import 'package:bookzbox/common/di/providers.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/home_screen/ui/screens/home_screen.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

final FirebaseAnalytics _analytics = FirebaseAnalytics();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...authProviders,
        ...mainProviders,
      ],
      child: MaterialApp(
        routes: {
          'auth_selection': (ctx) => Provider.of<AuthSelectionScreen>(ctx),
          'email_login': (ctx) => Provider.of<LoginScreen>(ctx),
          'email_new_account': (ctx) => Provider.of<CreateAccountScreen>(ctx),
          'main': (ctx) => Provider.of<HomeScreen>(ctx),
        },
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: _analytics),
        ],
        localizationsDelegates: [S.delegate],
        supportedLocales: S.delegate.supportedLocales,
        title: 'BookzBox',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: Consumer<AuthStore>(
          builder: (_, authStore, __) {
            return Observer(
              builder: (ctx) {
                if (authStore.isLoggedIn) {
                  print('User is logged in');
                  //return Provider.of<HomeScreen>(ctx);
                  return HomeScreen();
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
