import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/features/profile/ui/widgets/profile_avatar.dart';
import 'package:bookzbox/common/extensions/extensions.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';

class ChatFeedTab extends StatelessWidget {
  const ChatFeedTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView.builder(
        itemCount: sampleChatItems.length,
        itemBuilder: (ctx, i) {
          final chatItem = sampleChatItems[i];
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
              leading: ProfileAvatar(
                profileImgUrl: chatItem.otherUserThumbnail,
                displayName: chatItem.otherUserName,
                radius: 20.0,
              ),
              title: Text(
                chatItem.otherUserName,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subhead.copyWith(letterSpacing: 0.4),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 5.0),
                  Text(
                    chatItem.lastMessage,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(fontSize: 12.5, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        chatItem.timestamp.toTimeDifferenceString(context),
                        style: Theme.of(context).textTheme.caption,
                      ),
                      chatItem.read
                          ? SizedBox.shrink()
                          : Text(
                              S.of(context).activityNewItem,
                              style: Theme.of(context).textTheme.body1.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                    ],
                  ),
                ],
              ),
              isThreeLine: false,
              onTap: () => print('Clicked chat message'),
            ),
          );
        },
      ),
    );
  }
}
