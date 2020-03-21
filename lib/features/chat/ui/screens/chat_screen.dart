import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/features/chat/chat.dart';
import 'package:bookzbox/features/match/match.dart';
import 'package:bookzbox/features/profile/ui/widgets/profile_avatar.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreenArgs {
  final String chatId;
  final String otherUserName;
  final String otherUserThumbnail;

  ChatScreenArgs(this.chatId, this.otherUserName, this.otherUserThumbnail);
}

class ChatScreen extends StatefulWidget {
  /// The ID of the chat that is being displayed.
  final String chatId;

  /// The ID of the local client user that is logged in to the app.
  final String clientUserId;

  /// The username of the user that the client is chatting with.
  final String otherUsername;

  final ChatStore chatStore;

  final String otherUserThumbnail;

  ChatScreen({
    Key key,
    @required this.chatId,
    @required this.clientUserId,
    @required this.otherUsername,
    @required this.chatStore,
    this.otherUserThumbnail,
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
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => TradeScreen(),
              ),
            ),
            child: Text('Complete Trade'), //TODO: Localize
          ),
        ],
        title: Observer(
          builder: (ctx) => GestureDetector(
            onTap: () => widget.chatStore.otherUserId
                .map((id) => Navigator.pushNamed(ctx, Screens.profile, arguments: id))
                .getOrElse(() => null),
            child: Row(
              children: <Widget>[
                ProfileAvatar(
                  profileImgUrl: widget.otherUserThumbnail,
                  displayName: widget.otherUsername,
                ),
                SizedBox(width: 10.0),
                Text(widget.otherUsername),
              ],
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Column(
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
                          thumbnail: widget.otherUserThumbnail,
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
                      onPressed: () => getImage(ImageSource.camera),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.photo_library,
                        color: Theme.of(context).accentColor,
                      ),
                      onPressed: () => getImage(ImageSource.gallery),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controller,
                          onChanged: (input) => widget.chatStore.setChatInput(input),
                          minLines: 1,
                          maxLines: 6,
                          textCapitalization: TextCapitalization.sentences,
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
            Observer(
              builder: (_) => Visibility(
                visible: widget.chatStore.isUploadingImage,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.all(64.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      color: Colors.black54,
                    ),
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          S.of(context).chatImageUploading,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 21,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 18),
                          child: SpinKitThreeBounce(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getImage(ImageSource source) async {
    final image = await ImagePicker.pickImage(source: source, imageQuality: 50);
    if (image != null) {
      print('Image retrieved with path ${image.path}');
      widget.chatStore.uploadImage(image, widget.clientUserId, widget.chatId);
    }
  }

  void submitMessage() {
    controller.clear();
    widget.chatStore.postTextMessage(widget.clientUserId, widget.chatId);
    FocusScope.of(context).unfocus();
  }
}
