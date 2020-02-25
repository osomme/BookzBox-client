import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/box/models/my_box.dart';
import 'package:bookzbox/features/new_box/ui/screens/new_box_screen.dart';
import 'package:bookzbox/features/profile/stores/profile_store.dart';
import 'package:bookzbox/features/profile/ui/screens/boxes_tab.dart';
import 'package:bookzbox/features/profile/ui/screens/me_tab.dart';
import 'package:bookzbox/features/profile/ui/screens/preferences_tab.dart';
import 'package:bookzbox/features/profile/ui/widgets/custom_tab_bar.dart';
import 'package:bookzbox/features/profile/ui/widgets/my_box_list_item.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import '../../../authentication/authentication.dart';

class ProfileScreen extends StatefulWidget {
  final ProfileStore profileStore;

  ProfileScreen({Key key, @required this.profileStore}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const int numTabs = 3;

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);
    return DefaultTabController(
      length: numTabs,
      child: Scaffold(
        appBar: CustomTabBar(
          tabBar: TabBar(
            indicatorColor: Theme.of(context).accentColor,
            labelColor: Theme.of(context).accentColor,
            unselectedLabelColor: Colors.white,
            indicatorWeight: 3.5,
            tabs: [
              Tab(
                text: S.of(context).profileMeTabLabel,
                icon: Icon(
                  FontAwesome5Solid.user,
                  size: 20,
                ),
              ),
              Tab(
                text: S.of(context).profileBoxesTabLabel,
                icon: Icon(
                  FontAwesome5Solid.box_open,
                  size: 20,
                ),
              ),
              Tab(
                  text: S.of(context).profilePreferencesTabLabel,
                  icon: Icon(
                    FontAwesome5Solid.user_cog,
                    size: 20,
                  )),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MeTab(
              profileStore: widget.profileStore,
              authStore: authStore,
            ),
            BoxesTab(store: widget.profileStore),
            PreferencesTab(store: widget.profileStore),
          ],
        ),
      ),
    );
  }
}
