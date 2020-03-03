import 'package:bookzbox/features/activity/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

extension ActivityItemMapper on ActivityItem {
  ActivityListItem toListItem() {
    if (this.type is MessageActivity) {
      return _messageToListItem(this.type as MessageActivity);
    } else if (this.type is LikeActivity) {
      return _likeToListItem(this.type as LikeActivity);
    } else if (this.type is MatchActivity) {
      return _matchToListItem(this.type as MatchActivity);
    }
    return _unknownActivityItem();
  }
}

ActivityListItem _messageToListItem(MessageActivity activity) {
  return ActivityListItem(
    leadingIcon: Icon(Icons.chat),
    title: '${activity.username} sent you a message',
    subtitle: activity.newMessageSnippet,
    onClick: () => print('Clicked on message activity'),
  );
}

ActivityListItem _likeToListItem(LikeActivity activity) {
  return ActivityListItem(
    leadingIcon: Icon(MaterialCommunityIcons.heart),
    title: '${activity.likedByUsername} liked your box',
    subtitle: 'Click to see their profile and explore their boxes',
    onClick: () => print('Clicked on like activity'),
  );
}

ActivityListItem _matchToListItem(MatchActivity matchActivity) {
  return ActivityListItem(
    leadingIcon: Icon(Icons.people),
    title: '${matchActivity.matchUserName} has matched with you!',
    subtitle: 'Click to start chatting',
    onClick: () => print('Clicked on match item'),
  );
}

ActivityListItem _unknownActivityItem() {
  return ActivityListItem(
    leadingIcon: Icon(Icons.error),
    title: 'Unknown',
    subtitle: 'Unknown activity',
    onClick: null,
  );
}
