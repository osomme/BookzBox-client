import 'package:bookzbox/features/activity/ui/screens/activity_screen.dart';
import 'package:bookzbox/features/feed/ui/screens/feed_screen.dart';
import 'package:bookzbox/features/map/box_map.dart';
import 'package:bookzbox/features/profile/ui/screens/profile_screen.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentTab);
  }

  @override
  void dispose() {
    _pageController.dispose();
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
              return ActivityScreen();
            case 3:
              return ProfileScreen();
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
          icon: Icon(
            Icons.notifications,
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
