import 'package:bookzbox/common/widgets/keys.dart';
import 'package:bookzbox/features/profile/stores/preferences_store.dart';
import 'package:bookzbox/features/profile/stores/profile_box_store.dart';
import 'package:bookzbox/features/profile/stores/profile_store.dart';
import 'package:bookzbox/features/profile/ui/screens/boxes_tab.dart';
import 'package:bookzbox/features/profile/ui/screens/me_tab.dart';
import 'package:bookzbox/features/profile/ui/screens/preferences_tab.dart';
import 'package:bookzbox/features/profile/ui/widgets/profile_avatar.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../authentication/authentication.dart';

// The actions a user can take in the overflow menu.
enum UserOverflowAction {
  Logout,
}

class ProfileScreen extends StatefulWidget {
  final ProfileStore profileStore;
  final AuthStore authStore;
  final ProfileBoxStore profileBoxStore;
  final PreferencesStore preferencesStore;

  ProfileScreen({
    Key key,
    @required this.profileStore,
    @required this.authStore,
    @required this.profileBoxStore,
    @required this.preferencesStore,
  }) : super(key: key) {
    if (profileStore.isMyProfile) {
      profileStore.setUserId(authStore.user?.uid);
    }
    profileStore.init();
    profileBoxStore.init(profileStore.userId, profileStore.isMyProfile);
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
        profileStore: widget.profileStore,
        boxStore: widget.profileBoxStore,
      ),
    ];
    if (widget.profileStore.isMyProfile) {
      tabScreens.add(
        PreferencesTab(
          profileStore: widget.profileStore,
          preferencesStore: widget.preferencesStore,
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
      return AppBar(
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 16, right: 16),
            child: Row(
              children: <Widget>[
                Observer(
                  builder: (_) => Container(
                    margin: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      S
                          .of(context)
                          .profileDisplayNameGreeting(widget.profileStore.profile.displayName),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            blurRadius: 1.0,
                            offset: Offset(1.0, 1.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                PopupMenuButton<UserOverflowAction>(
                  key: Key(Keys.profileMenuBtnKey),
                  child: Observer(
                    builder: (_) => ProfileAvatar(
                      displayName: widget.profileStore.profile.displayName,
                      profileImgUrl: widget.profileStore.profile.photoUrl,
                      circleColor: Colors.grey[600],
                      forceCircleColor: true,
                    ),
                  ),
                  onSelected: (UserOverflowAction result) {
                    if (result == UserOverflowAction.Logout) {
                      widget.authStore.logOut();
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<UserOverflowAction>>[
                    PopupMenuItem(
                      height: 48.0,
                      value: UserOverflowAction.Logout,
                      child: Row(
                        key: Key(Keys.logoutBtnKey),
                        children: <Widget>[
                          Icon(
                            Icons.exit_to_app,
                            size: 20,
                            color: Colors.black,
                          ),
                          Text(
                            S.of(context).profileLogout,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
        bottom: tabBar,
      );
    } else {
      return AppBar(
        title: Observer(builder: (_) {
          return Text(widget.profileStore.profile.displayName);
        }),
        bottom: tabBar,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: (widget.profileStore.isMyProfile ? numTabs : numTabs - 1),
      child: Scaffold(
        key: Key(Keys.profileScreenKey),
        appBar: getAppBar(context),
        body: TabBarView(
          children: getTabScreens(context),
        ),
      ),
    );
  }
}
