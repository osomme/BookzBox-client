import 'dart:async';

import 'package:badges/badges.dart';
import 'package:bookzbox/common/di/providers.dart';
import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/features/activity/stores/my_liked_boxes_store.dart';
import 'package:bookzbox/features/activity/ui/screens/activity_screen.dart';
import 'package:bookzbox/features/authentication/stores/auth_store.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/feed/ui/screens/feed_screen.dart';
import 'package:bookzbox/features/map/box_map.dart';
import 'package:bookzbox/features/profile/stores/activity_status_store.dart';
import 'package:bookzbox/features/profile/stores/preferences_store.dart';
import 'package:bookzbox/features/profile/stores/profile_box_store.dart';
import 'package:bookzbox/features/profile/stores/profile_store.dart';
import 'package:bookzbox/features/profile/ui/screens/profile_screen.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final ActivityFeedStore activityFeedStore;
  final AuthStore authStore;
  final ActivityStatusStore activityStatusStore;

  const HomeScreen({
    Key key,
    @required this.activityFeedStore,
    @required this.authStore,
    @required this.activityStatusStore,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  PageController _pageController;
  ReactionDisposer _userAuthListener;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentTab);
    _userAuthListener = autorun((_) {
      if (widget.authStore.user != null) {
        widget.activityFeedStore.loadFeed(widget.authStore.user.uid);
      }
    });
    runPeriodicActivityStatusUpdate(true);
  }

  /// Updates the current users activity status, "last seen", periodicaly.
  /// [initial] Whether or not the activity status should be updated initially.
  ///           If false, then the first update is after the set amount of time.
  void runPeriodicActivityStatusUpdate(bool initial) {
    Timer.periodic(Duration(minutes: 5), (Timer t) async {
      print("Updating activity status for user with id: " + widget.authStore.user?.uid);
      return await widget.activityStatusStore.updateStatus(widget.authStore.user?.uid);
    });
    if (initial) {
      print("Initial activity status update for user: " + widget.authStore.user?.uid);
      widget.activityStatusStore.updateStatus(widget.authStore.user?.uid);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _userAuthListener();
    widget.activityFeedStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentTab = index),
        itemBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return Provider.of<FeedScreen>(context);
            case 1:
              return Provider.of<BoxMapScreen>(context);
            case 2:
              return MultiProvider(
                providers: [
                  ...boxLoaderProviders,
                  ...likedBoxesStore,
                ],
                child: Consumer<MyLikedBoxesStore>(
                  builder: (ctx, likedBoxesStore, __) => ActivityScreen(
                    userId: widget.authStore.user.uid,
                    activityFeedStore: widget.activityFeedStore,
                    boxLikeStore: likedBoxesStore,
                  ),
                ),
              );
            case 3:
              return ProfileScreen(
                authStore: Provider.of<AuthStore>(context),
                profileBoxStore: Provider.of<ProfileBoxStore>(context),
                profileStore: Provider.of<ProfileStore>(context),
                preferencesStore: Provider.of<PreferencesStore>(context),
              );
            default:
              throw 'Index ($index) must be in range 0-3';
          }
        },
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentTab,
      onTap: (index) {
        setState(() => _currentTab = index);
        _pageController.jumpToPage(index);
      },
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          title: Text(S.of(context).homeNavBarFeedLabel),
          icon: Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          title: Text(S.of(context).homeNavBarMapLabel),
          icon: Icon(
            Icons.map,
          ),
        ),
        BottomNavigationBarItem(
          title: Text(S.of(context).homeNavBarActivityLabel),
          icon: Observer(
            builder: (_) => Badge(
              showBadge: widget.activityFeedStore.hasUnread,
              badgeColor: Theme.of(context).primaryColor,
              badgeContent: Text(
                '${widget.activityFeedStore.numTotalUnread}',
                style: Theme.of(context).primaryTextTheme.body1.copyWith(fontSize: 11.0),
              ),
              padding: EdgeInsets.all(6.0),
              child: Icon(
                Icons.notifications,
              ),
            ),
          ),
        ),
        BottomNavigationBarItem(
          title: Text(S.of(context).homeNavBarProfileLabel),
          icon: Icon(
            Icons.person,
          ),
        ),
      ],
    );
  }
}
