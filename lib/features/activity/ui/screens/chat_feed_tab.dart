import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/common/widgets/widgets.dart';
import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/features/chat/chat.dart';
import 'package:bookzbox/features/profile/ui/widgets/profile_avatar.dart';
import 'package:bookzbox/common/extensions/extensions.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ChatFeedTab extends StatelessWidget {
  final ActivityFeedStore feedStore;

  const ChatFeedTab({
    Key key,
    @required this.feedStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Observer(
        builder: (_) {
          if (feedStore.chatNotifications.isEmpty) {
            return ErrorTextWithIcon(
              text: S.of(context).activityNoChatItems,
              icon: Icon(
                Icons.chat,
                color: Colors.grey,
                size: 64.0,
              ),
            );
          }
          return ListView.builder(
            itemCount: feedStore.chatNotifications.length,
            itemBuilder: (ctx, i) {
              final chatNotification = feedStore.chatNotifications[i];
              final chatData = chatNotification.type as MessageActivity;
              return Card(
                color: chatNotification.read ? Colors.white : Colors.grey[200],
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                  leading: ProfileAvatar(
                    profileImgUrl: chatData.otherUserThumbnail,
                    displayName: chatData.otherUserName,
                    radius: 20.0,
                  ),
                  title: Text(
                    chatData.otherUserName,
                    overflow: TextOverflow.ellipsis,
                    style:
                        Theme.of(context).textTheme.subhead.copyWith(letterSpacing: 0.4),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 5.0),
                      Text(
                        chatData.lastMessage ?? 'Click to start chatting',
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
                            chatNotification.timestamp.toTimeDifferenceString(context),
                            style: Theme.of(context).textTheme.caption,
                          ),
                          chatNotification.read
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
                  onTap: () => Navigator.pushNamed(
                    context,
                    Screens.chat,
                    arguments: ChatScreenArgs(
                      chatData.chatId,
                      chatData.otherUserName,
                      chatData.otherUserThumbnail,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
