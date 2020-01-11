import 'package:flutter/material.dart';
import 'package:bookzbox/features/authentication/authentication.dart';

class HomeScreen extends StatelessWidget {
  final AuthStore authStore;

  HomeScreen(this.authStore);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ADD TEXT HERE'),
            RaisedButton(
              onPressed: authStore.logOut,
              child: Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
