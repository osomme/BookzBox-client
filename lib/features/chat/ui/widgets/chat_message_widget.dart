import 'package:bookzbox/features/chat/chat.dart';
import 'package:bookzbox/features/profile/ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatMessageItem extends StatelessWidget {
  final bool isClientUser;
  final ChatMessage message;

  /// Optional parameter used for when the message is representing another user (not client user).
  final String username;

  const ChatMessageItem({
    Key key,
    @required this.isClientUser,
    @required this.message,
    this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:
                isClientUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: <Widget>[
              isClientUser
                  ? SizedBox.shrink()
                  : ProfileAvatar(
                      profileImgUrl: null,
                      displayName: username,
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
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(color: Colors.white, fontSize: 15.0),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.0),
          Padding(
            padding: isClientUser
                ? const EdgeInsets.only(right: 0.0)
                : const EdgeInsets.only(left: 40.0),
            child: Text(
              DateFormat('E d. MMMM ').format(message.timestamp) +
                  extractTimeString(DateFormat('H:m').format(message.timestamp)),
              textAlign: isClientUser ? TextAlign.end : TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: Colors.white, fontSize: 11.0),
            ),
          ),
        ],
      ),
    );
  }

  String extractTimeString(String dateString) {
    return dateString.split(':').map((s) {
      final int numValue = int.tryParse(s);
      return numValue != null && numValue >= 0 && numValue <= 9 ? '0' + s : s;
    }).join(':');
  }
}
