import 'package:bookzbox/features/chat/chat.dart';
import 'package:bookzbox/features/profile/ui/widgets/profile_avatar.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ChatScreenArgs {
  final String chatId;
  final String otherUserName;

  ChatScreenArgs(this.chatId, this.otherUserName);
}

class ChatScreen extends StatefulWidget {
  /// The ID of the chat that is being displayed.
  final String chatId;

  /// The ID of the local client user that is logged in to the app.
  final String clientUserId;

  /// The username of the user that the client is chatting with.
  final String otherUsername;

  final ChatStore chatStore;

  ChatScreen({
    Key key,
    @required this.chatId,
    @required this.clientUserId,
    @required this.otherUsername,
    @required this.chatStore,
  }) : super(key: key) {
    chatStore.loadChatStream(chatId, clientUserId);
  }

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    widget.chatStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            ProfileAvatar(
              profileImgUrl: null,
              displayName: widget.otherUsername,
            ),
            SizedBox(width: 10.0),
            Text(widget.otherUsername),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Observer(
                builder: (_) => ListView.builder(
                  itemCount: widget.chatStore.messages.length,
                  reverse: true,
                  itemBuilder: (ctx, i) {
                    final msg = widget.chatStore.messages[i];
                    final isClientUsersMessage =
                        msg.postedByUserId == widget.clientUserId;
                    return ChatMessageItem(
                      isClientUser: isClientUsersMessage,
                      message: msg,
                      username: isClientUsersMessage ? null : widget.otherUsername,
                    );
                  },
                ),
              ),
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () => print('Pressed image button'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller,
                      onChanged: (input) => widget.chatStore.setChatInput(input),
                      minLines: 1,
                      maxLines: 6,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: S.of(context).chatInputHint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Observer(
                  builder: (_) => IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).accentColor,
                    ),
                    onPressed: widget.chatStore.isInputValid ? submitMessage : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void submitMessage() {
    controller.clear();
    widget.chatStore.postMessage(widget.clientUserId, widget.chatId);
    FocusScope.of(context).unfocus();
  }
}
