import 'package:bookzbox/features/chat/chat.dart';
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
    print('[CHAT userID: $clientUserId');
    print('[CHAT chatID: $chatId');
    chatStore.loadChatStream(chatId);
  }

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void dispose() {
    widget.chatStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Chat with ${widget.otherUsername}'),
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
                    return ChatMessageItem(
                      isClientUser: msg.postedByUserId == widget.clientUserId,
                      message: msg,
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
                      onChanged: (input) => widget.chatStore.setChatInput(input),
                      minLines: 1,
                      maxLines: 6,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: 'Write a message...',
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
                    onPressed: widget.chatStore.isInputValid
                        ? () => widget.chatStore
                            .postMessage(widget.clientUserId, widget.chatId)
                        : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
