import 'package:badges/badges.dart';
import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/features/activity/stores/my_liked_boxes_store.dart';
import 'package:bookzbox/features/profile/ui/widgets/custom_tab_bar.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ActivityScreen extends StatefulWidget {
  /// The activity feed store that the screen needs to fetch data.
  final ActivityFeedStore activityFeedStore;

  /// Liked boxes store used to fetch data.
  final MyLikedBoxesStore boxLikeStore;

  /// The user ID of the user whos activity feed is being shown.
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
                    showBadge: widget.activityFeedStore.hasUnreadActivityNotifications,
                    badgeColor: Theme.of(context).accentColor,
                    badgeContent: Text(
                      '${widget.activityFeedStore.numUnreadActivityNotifications}',
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
                icon: Observer(
                  builder: (_) => Badge(
                    showBadge: widget.activityFeedStore.hasUnreadChatMessages,
                    badgeColor: Theme.of(context).accentColor,
                    badgeContent: Text(
                      '${widget.activityFeedStore.numUnreadChatMessages}',
                      style: Theme.of(context)
                          .accentTextTheme
                          .body1
                          .copyWith(fontSize: 11.0),
                    ),
                    padding: EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.chat,
                    ),
                  ),
                ),
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
            ActivityFeedTab(
              activityFeedStore: widget.activityFeedStore,
              userId: widget.userId,
            ),
            ChatFeedTab(feedStore: widget.activityFeedStore),
            LikedBoxesTab(
              likedBoxesStore: widget.boxLikeStore,
              userId: widget.userId,
            ),
          ],
        ),
        floatingActionButton: Observer(
          builder: (ctx) => widget.activityFeedStore.hasUnread
              ? FloatingActionButton.extended(
                  onPressed: () => widget.activityFeedStore.markAllAsRead(widget.userId),
                  icon: Icon(
                    Icons.clear_all,
                    size: 20.0,
                  ),
                  label: Text(
                    S.of(context).activityClearAllUnread,
                    style: TextStyle(fontSize: 10.0),
                  ),
                )
              : SizedBox.shrink(),
        ),
      ),
    );
  }
}
