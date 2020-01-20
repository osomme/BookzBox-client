import 'package:bookzbox/features/activity/ui/screens/activity_screen.dart';
import 'package:bookzbox/features/feed/ui/screens/feed_screen.dart';
import 'package:bookzbox/features/profile/ui/screens/profile_screen.dart';
import 'package:bookzbox/features/search/ui/screens/search_screen.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';

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
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentTab = index);
        },
        children: <Widget>[
          FeedScreen(),
          SearchScreen(),
          ActivityScreen(),
          ProfileScreen(),
        ],
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
          title: Text(S.of(context).homeNavBarSearchLabel),
          icon: Icon(
            Icons.search,
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
