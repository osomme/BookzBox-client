import 'package:bookzbox/common/ui/screens/home_screen.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
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
        Provider<AuthStore>(create: (_) => AuthStore()),
        Provider<LoginCredentialsStore>(create: (_) => LoginCredentialsStore()),
        Provider<NewAccountStore>(create: (_) => NewAccountStore()),
      ],
      child: MaterialApp(
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
                print("Login state changed, new value: ${authStore.isLoggedIn}");
                if (authStore.isLoggedIn) {
                  return HomeScreen(authStore);
                } else {
                  return LoginScreen(authStore, Provider.of<LoginCredentialsStore>(ctx));
                }
              },
            );
          },
        ),
      ),
    );
  }
}
