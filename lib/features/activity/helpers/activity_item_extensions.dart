import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

extension ActivityItemMapper on ActivityItem {
  /// Maps a ActivityItem to a ActivityListItem to be displayed in a list view.
  ActivityListItem toListItem(BuildContext context) {
    if (this.type is MessageActivity) {
      return _messageToListItem(
          this.type as MessageActivity, this.timestamp, this.read, context);
    } else if (this.type is LikeActivity) {
      return _likeToListItem(
          this.type as LikeActivity, this.timestamp, this.read, context);
    } else if (this.type is MatchActivity) {
      return _matchToListItem(
          this.type as MatchActivity, this.timestamp, this.read, context);
    }
    return _unknownActivityItem(context);
  }
}

//' wrote: ${activity.newMessageSnippet}'

ActivityListItem _messageToListItem(
    MessageActivity activity, DateTime timestamp, bool read, BuildContext ctx) {
  return ActivityListItem(
    leading: Icon(Icons.chat),
    subtitleTexts: [
      ActivityItemTextParam(content: activity.username, bold: true),
      ActivityItemTextParam(
          content: S.of(ctx).activityItemMessagePost + activity.newMessageSnippet),
    ],
    date: timestamp,
    onClick: () => print('Clicked on message activity'),
    read: read,
  );
}

ActivityListItem _likeToListItem(
    LikeActivity activity, DateTime timestamp, bool read, BuildContext ctx) {
  return ActivityListItem(
    leading: Icon(MaterialCommunityIcons.heart),
    subtitleTexts: [
      ActivityItemTextParam(content: activity.likedByUsername, bold: true),
      ActivityItemTextParam(content: S.of(ctx).activityItemLikeMiddle),
      ActivityItemTextParam(content: activity.boxTitle, bold: true),
    ],
    date: timestamp,
    onClick: () => print('Clicked on like activity'),
    read: read,
    //trailing: IconButton(icon: Icon(Icons.person), onPressed: () => print('')),
  );
}

ActivityListItem _matchToListItem(
    MatchActivity matchActivity, DateTime timestamp, bool read, BuildContext ctx) {
  return ActivityListItem(
    leading: Icon(Icons.people),
    subtitleTexts: [
      ActivityItemTextParam(content: matchActivity.matchUserName, bold: true),
      ActivityItemTextParam(content: S.of(ctx).activityItemMatchPost),
    ],
    date: timestamp,
    onClick: () => print('Clicked on match item'),
    read: read,
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
