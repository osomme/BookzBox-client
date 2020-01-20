import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../authentication/authentication.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Log out',
              style: Theme.of(context).primaryTextTheme.button,
            ),
            onPressed: authStore.logOut,
          ),
        ],
      ),
      body: Center(
        child: Text('Profile Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print('Create new box pressed'),
      ),
    );
  }
}
