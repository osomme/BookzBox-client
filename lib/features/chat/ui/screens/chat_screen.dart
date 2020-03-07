import 'package:bookzbox/features/chat/chat.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  /// The ID of the chat that is being displayed.
  final String chatId;

  /// The ID of the local client user that is logged in to the app.
  final String userId;

  //TODO: Add chat messaging store dependency
  ChatScreen({
    Key key,
    @required this.chatId,
    @required this.userId,
  }) : super(key: key) {
    print('[CHAT userID: $userId');
    print('[CHAT chatID: $chatId');
  }

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _msgs.length,
                reverse: true,
                itemBuilder: (ctx, i) {
                  final msg = _msgs[i];
                  return ChatMessageItem(
                    isClientUser: msg.postedByUserId == '1',
                    message: msg,
                  );
                },
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
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: 'Write a message...',
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () => print('Pressed'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final _usr1 = 'Oskar Sømme';
final _usr2 = 'Håvard Thunold';

final _msgs = [
  ChatMessage(
    postedByUsername: _usr1,
    postedByUserId: '1',
    content: 'This is a sample text!',
    timestamp: DateTime.now().subtract(Duration(minutes: 2)),
  ),
  ChatMessage(
    postedByUsername: _usr2,
    postedByUserId: '2',
    content: 'This is a response to the text above me...',
    timestamp: DateTime.now().subtract(Duration(minutes: 8)),
  ),
  ChatMessage(
    postedByUsername: _usr1,
    postedByUserId: '1',
    content:
        'And here comes a longer text to see how things scale when they go for a bit longer than normally. This is not a very long message but we can keep typing random stuff to see how good or bad it looks mmkay.',
    timestamp: DateTime.now().subtract(Duration(hours: 2)),
  ),
];
