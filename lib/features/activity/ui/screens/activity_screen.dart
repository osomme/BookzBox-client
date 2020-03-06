import 'package:badges/badges.dart';
import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/features/activity/stores/my_liked_boxes_store.dart';
import 'package:bookzbox/features/profile/ui/widgets/custom_tab_bar.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ActivityScreen extends StatefulWidget {
  final ActivityFeedStore activityFeedStore;
  final MyLikedBoxesStore boxLikeStore;
  final String userId;

  const ActivityScreen({
    Key key,
    @required this.activityFeedStore,
    @required this.boxLikeStore,
    @required this.userId,
  }) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  void dispose() {
    widget.boxLikeStore.dispose();
    super.dispose();
  }

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
                icon: Observer(
                  builder: (_) => Badge(
                    showBadge: widget.activityFeedStore.hasUnread,
                    badgeColor: Theme.of(context).accentColor,
                    badgeContent: Text(
                      '${widget.activityFeedStore.numUnread}',
                      style: Theme.of(context)
                          .accentTextTheme
                          .body1
                          .copyWith(fontSize: 11.0),
                    ),
                    padding: EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.notifications,
                    ),
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
            LikedBoxesTab(likedBoxesStore: widget.boxLikeStore, userId: widget.userId),
          ],
        ),
      ),
    );
  }
}
