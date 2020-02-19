import 'package:bookzbox/features/new_box/ui/screens/new_box_screen.dart';
import 'package:bookzbox/features/profile/stores/profile_store.dart';
import 'package:bookzbox/features/profile/ui/widgets/boxes_tab_widget.dart';
import 'package:bookzbox/features/profile/ui/widgets/me_tab_widget.dart';
import 'package:bookzbox/features/profile/ui/widgets/preferences_tab_widget.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import '../../../authentication/authentication.dart';

class ProfileScreen extends StatefulWidget {
  final ProfileStore profileStore;

  const ProfileScreen({Key key, this.profileStore}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const int numTabs = 3;

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);
    return MaterialApp(
      theme: Theme.of(context),
      home: DefaultTabController(
        length: numTabs,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              FlatButton(
                child: Text(
                  S.of(context).profileLogout,
                  style: Theme.of(context).primaryTextTheme.button,
                ),
                onPressed: authStore.logOut,
              ),
            ],
            bottom: TabBar(
              indicatorColor: Theme.of(context).accentColor,
              labelColor: Theme.of(context).accentColor,
              unselectedLabelColor: Colors.white,
              indicatorWeight: 3.5,
              tabs: [
                Tab(
                  text: S.of(context).profileMeTabLabel,
                ),
                Tab(
                  text: S.of(context).profileBoxesTabLabel,
                ),
                Tab(
                  text: S.of(context).profilePreferencesTabLabel,
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MeTab(store: widget.profileStore),
              BoxesTab(store: widget.profileStore),
              PreferencesTab(store: widget.profileStore),
            ],
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
        ),
      ),
    );
  }
}
