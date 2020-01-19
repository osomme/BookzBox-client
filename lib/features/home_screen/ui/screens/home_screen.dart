import 'package:bookzbox/features/activity/ui/screens/activity_screen.dart';
import 'package:bookzbox/features/feed/ui/screens/feed_screen.dart';
import 'package:bookzbox/features/profile/ui/screens/profile_screen.dart';
import 'package:bookzbox/features/search/ui/screens/search_screen.dart';
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
    _pageController = PageController();
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

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentTab,
      onTap: (index) {
        setState(() => _currentTab = index);
        _pageController.jumpToPage(index);
      },
      selectedItemColor: Colors.blueGrey[700],
      items: [
        BottomNavigationBarItem(
          title: Text('Feed'),
          icon: Icon(
            Icons.home,
            size: 32.0,
            color: Colors.grey,
          ),
        ),
        BottomNavigationBarItem(
          title: Text('Search'),
          icon: Icon(
            Icons.search,
            size: 32.0,
            color: Colors.grey,
          ),
        ),
        BottomNavigationBarItem(
          title: Text('Activity'),
          icon: Icon(
            Icons.notifications,
            size: 32.0,
            color: Colors.grey,
          ),
        ),
        BottomNavigationBarItem(
          title: Text('Profile'),
          icon: Icon(
            Icons.person,
            size: 32.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
