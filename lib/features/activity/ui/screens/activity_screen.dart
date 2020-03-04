import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/features/profile/ui/widgets/custom_tab_bar.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomTabBar(
          tabBar: TabBar(
            indicatorColor: Theme.of(context).accentColor,
            labelColor: Theme.of(context).accentColor,
            unselectedLabelColor: Colors.white,
            indicatorWeight: 3.5,
            tabs: [
              Tab(
                text: 'Activity',
                icon: Icon(Icons.notifications),
              ),
              Tab(
                text: 'Messages',
                icon: Icon(Icons.chat),
              ),
              Tab(
                text: 'Likes',
                icon: Icon(MaterialCommunityIcons.heart),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: ListView.builder(
                itemCount: testActivityFeedItems.length,
                itemBuilder: (ctx, i) => testActivityFeedItems[i].toListItem(context),
              ),
            ),
            Center(
              child: Text('Messages tab'),
            ),
            Center(
              child: Text('Likes tab'),
            ),
          ],
        ),
      ),
    );
  }
}
