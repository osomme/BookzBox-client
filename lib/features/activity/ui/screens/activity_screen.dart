import 'package:badges/badges.dart';
import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/features/profile/ui/widgets/custom_tab_bar.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ActivityScreen extends StatefulWidget {
  final ActivityFeedStore activityFeedStore;

  const ActivityScreen({
    Key key,
    @required this.activityFeedStore,
  }) : super(key: key);

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
                text: S.of(context).activityTabLabelActivity,
                icon: Badge(
                  showBadge: widget.activityFeedStore.hasUnread,
                  badgeColor: Theme.of(context).accentColor,
                  badgeContent: Text(
                    '${widget.activityFeedStore.numUnread}',
                    style:
                        Theme.of(context).accentTextTheme.body1.copyWith(fontSize: 11.0),
                  ),
                  padding: EdgeInsets.all(6.0),
                  child: Icon(
                    Icons.notifications,
                  ),
                ),
              ),
              Tab(
                text: S.of(context).activityTabLabelMessages,
                icon: Icon(Icons.chat),
              ),
              Tab(
                text: S.of(context).activityTabLabelLikes,
                icon: Icon(MaterialCommunityIcons.heart),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ActivityFeedTab(activityFeedStore: widget.activityFeedStore),
            ChatFeedTab(),
            LikedBoxesTab(),
          ],
        ),
      ),
    );
  }
}
