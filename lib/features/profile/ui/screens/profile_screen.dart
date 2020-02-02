import 'package:bookzbox/features/new_box/ui/screens/new_box_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
        child: Align(
          alignment: Alignment(-0.2, 0.075),
          child: Icon(
            FontAwesome5Solid.box_open,
            size: 20,
          ),
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => Provider.of<NewBoxScreen>(ctx))),
      ),
    );
  }
}
