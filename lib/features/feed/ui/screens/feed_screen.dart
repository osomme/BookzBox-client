import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> with SingleTickerProviderStateMixin {
  PageController _pageController;
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).feedTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(SimpleLineIcons.options),
            onPressed: () => print('Options pressed'),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 60.0),
        children: <Widget>[
          Container(
            height: 500.0,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _selectedPage = index),
              itemCount: plants.length,
              itemBuilder: (context, index) =>
                  FeedListItem(pageController: _pageController, index: index),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  S.of(context).feedDescription,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  plants[_selectedPage].description,
                  style: Theme.of(context).accentTextTheme.body1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
