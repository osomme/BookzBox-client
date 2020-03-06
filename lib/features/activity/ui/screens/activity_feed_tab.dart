import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/common/widgets/widgets.dart';
import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ActivityFeedTab extends StatelessWidget {
  final ActivityFeedStore activityFeedStore;
  final String userId;

  const ActivityFeedTab({
    Key key,
    @required this.activityFeedStore,
    @required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Observer(
        builder: (_) {
          if (activityFeedStore.hasError) {
            return ErrorTextWithIcon(
              text: S.of(context).activityFailedBoxLoad,
              icon: Icon(
                Icons.error,
                color: Colors.grey,
                size: 64.0,
              ),
            );
          }
          if (activityFeedStore.feedItems.isEmpty) {
            return ErrorTextWithIcon(
              text: S.of(context).activityNoFeedItems,
              icon: Icon(
                FontAwesome5Solid.bell_slash,
                color: Colors.grey,
                size: 64.0,
              ),
            );
          }
          return ListView.builder(
            itemCount: activityFeedStore.feedItems.length,
            itemBuilder: (ctx, i) => _toListItem(context, activityFeedStore.feedItems[i]),
          );
        },
      ),
    );
  }

  /// Maps a ActivityItem to a ActivityListItem to be displayed in a list view.
  ActivityListItem _toListItem(BuildContext context, ActivityItem item) {
    if (item.type is MessageActivity) {
      return _messageToListItem(item.type as MessageActivity, item, context);
    } else if (item.type is LikeActivity) {
      return _likeToListItem(item.type as LikeActivity, item, context);
    } else if (item.type is MatchActivity) {
      return _matchToListItem(item.type as MatchActivity, item, context);
    }
    return _unknownActivityItem(context);
  }

  ActivityListItem _messageToListItem(
      MessageActivity activity, ActivityItem activityItem, BuildContext ctx) {
    return ActivityListItem(
      leading: Icon(Icons.chat),
      subtitleTexts: [
        ActivityItemTextParam(content: activity.username, bold: true),
        ActivityItemTextParam(
            content: S.of(ctx).activityItemMessagePost + activity.newMessageSnippet),
      ],
      date: activityItem.timestamp,
      onClick: () => print('Clicked on message activity'),
      read: activityItem.read,
    );
  }

  ActivityListItem _likeToListItem(
      LikeActivity activity, ActivityItem activityItem, BuildContext ctx) {
    return ActivityListItem(
      leading: Icon(MaterialCommunityIcons.heart),
      subtitleTexts: [
        ActivityItemTextParam(content: activity.likedByUsername, bold: true),
        ActivityItemTextParam(content: S.of(ctx).activityItemLikeMiddle),
        ActivityItemTextParam(content: activity.boxTitle, bold: true),
      ],
      date: activityItem.timestamp,
      onClick: () {
        activityFeedStore.markAsRead(userId, activityItem.id);
        Navigator.pushNamed(ctx, Screens.profile, arguments: activity.likedByUserId);
      },
      read: activityItem.read,
      //trailing: IconButton(icon: Icon(Icons.person), onPressed: () => print('')),
    );
  }

  ActivityListItem _matchToListItem(
      MatchActivity matchActivity, ActivityItem activityItem, BuildContext ctx) {
    return ActivityListItem(
      leading: Icon(Icons.people),
      subtitleTexts: [
        ActivityItemTextParam(content: matchActivity.matchUserName, bold: true),
        ActivityItemTextParam(content: S.of(ctx).activityItemMatchPost),
      ],
      date: activityItem.timestamp,
      onClick: () => print('Clicked on match item'),
      read: activityItem.read,
    );
  }

  ActivityListItem _unknownActivityItem(BuildContext ctx) {
    return ActivityListItem(
      leading: Icon(Icons.error),
      subtitleTexts: [ActivityItemTextParam(content: S.of(ctx).activityItemUnknown)],
      onClick: null,
      read: false,
    );
  }
}
