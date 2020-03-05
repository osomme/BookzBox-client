import 'package:badges/badges.dart';
import 'package:bookzbox/common/di/providers.dart';
import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/features/activity/stores/my_liked_boxes_store.dart';
import 'package:bookzbox/features/activity/ui/screens/activity_screen.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/feed/ui/screens/feed_screen.dart';
import 'package:bookzbox/features/map/box_map.dart';
import 'package:bookzbox/features/profile/ui/screens/profile_screen.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final ActivityFeedStore activityFeedStore;
  final AuthStore authStore;

  const HomeScreen({
    Key key,
    @required this.activityFeedStore,
    @required this.authStore,
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
  }

  @override
  void dispose() {
    _pageController.dispose();
    _userAuthListener();
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
              return Provider.of<ProfileScreen>(context);
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
                '${widget.activityFeedStore.numUnread}',
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
