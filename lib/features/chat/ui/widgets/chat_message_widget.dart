import 'package:bookzbox/features/chat/chat.dart';
import 'package:bookzbox/features/profile/ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class ChatMessageItem extends StatelessWidget {
  final bool isClientUser;
  final ChatMessage message;

  const ChatMessageItem({
    Key key,
    @required this.isClientUser,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: isClientUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          isClientUser
              ? SizedBox.shrink()
              : ProfileAvatar(
                  profileImgUrl: null,
                  displayName: message.postedByUsername,
                ),
          SizedBox(width: 5.0),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            decoration: BoxDecoration(
              color: isClientUser ? Colors.blue : Colors.grey[700],
              borderRadius: BorderRadius.circular(9.0),
            ),
            padding: EdgeInsets.all(14.0),
            child: Text(
              message.content,
              style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
