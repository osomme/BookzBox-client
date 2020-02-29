import 'package:bookzbox/features/profile/models/profile.dart';
import 'package:bookzbox/features/profile/stores/profile_store.dart';
import 'package:bookzbox/features/profile/ui/screens/boxes_tab.dart';
import 'package:bookzbox/features/profile/ui/screens/me_tab.dart';
import 'package:bookzbox/features/profile/ui/screens/preferences_tab.dart';
import 'package:bookzbox/features/profile/ui/widgets/custom_tab_bar.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import '../../../authentication/authentication.dart';

class ProfileScreen extends StatefulWidget {
  final ProfileStore profileStore;
  final AuthStore authStore;

  ProfileScreen({
    Key key,
    @required this.profileStore,
    @required this.authStore,
  }) : super(key: key) {
    if (profileStore.isMyProfile) {
      profileStore.setUserId(authStore.user.uid);
    }
    profileStore.init();
  }

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const int numTabs = 3;

  List<Tab> getTabs(BuildContext context) {
    List<Tab> tabs = [
      Tab(
        text: (widget.profileStore.isMyProfile
            ? S.of(context).profileMeTabLabel
            : S.of(context).profileOtherTabLabel),
        icon: Icon(
          FontAwesome5Solid.user,
          size: 20,
        ),
      ),
      Tab(
        text: (widget.profileStore.isMyProfile
            ? S.of(context).profileMyBoxesTabLabel
            : S.of(context).profileBoxesTabLabel),
        icon: Icon(
          FontAwesome5Solid.box_open,
          size: 20,
        ),
      ),
    ];
    if (widget.profileStore.isMyProfile) {
      tabs.add(
        Tab(
          text: S.of(context).profilePreferencesTabLabel,
          icon: Icon(
            FontAwesome5Solid.user_cog,
            size: 20,
          ),
        ),
      );
    }
    return tabs;
  }

  List<Widget> getTabScreens(BuildContext context) {
    List<Widget> tabScreens = [
      MeTab(
        profileStore: widget.profileStore,
        authStore: widget.authStore,
      ),
      BoxesTab(
        store: widget.profileStore,
      ),
    ];
    if (widget.profileStore.isMyProfile) {
      tabScreens.add(
        PreferencesTab(
          store: widget.profileStore,
        ),
      );
    }
    return tabScreens;
  }

  PreferredSizeWidget getAppBar(BuildContext context) {
    var tabBar = TabBar(
      indicatorColor: Theme.of(context).accentColor,
      labelColor: Theme.of(context).accentColor,
      unselectedLabelColor: Colors.white,
      indicatorWeight: 3.5,
      tabs: getTabs(context),
    );

    if (widget.profileStore.isMyProfile) {
      return CustomTabBar(
        tabBar: tabBar,
      );
    } else {
      return AppBar(
        title: Text(widget.profileStore.profile.displayName),
        bottom: tabBar,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: (widget.profileStore.isMyProfile ? numTabs : numTabs - 1),
      child: Scaffold(
        appBar: getAppBar(context),
        body: TabBarView(
          children: getTabScreens(context),
        ),
      ),
    );
  }
}
