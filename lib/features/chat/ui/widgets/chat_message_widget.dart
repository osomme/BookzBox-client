import 'package:bookzbox/features/chat/chat.dart';
import 'package:bookzbox/features/profile/ui/widgets/profile_avatar.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

/// Widget containing a single chat message.
class ChatMessageItem extends StatelessWidget {
  /// Whether the message belongs to the client user.
  final bool isClientUser;

  /// The chat message itself.
  final ChatMessage message;

  /// Optional parameter to an URL to an image that can be used as a thumbnail.
  final String thumbnail;

  /// Optional parameter used for when the message is representing another user (not client user).
  final String username;

  const ChatMessageItem({
    Key key,
    @required this.isClientUser,
    @required this.message,
    this.username,
    this.thumbnail,
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
                      profileImgUrl: thumbnail,
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
                child: Builder(
                  builder: (ctx) {
                    switch (message.contentType) {
                      case ChatMessageType.Text:
                        return Text(
                          message.content,
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(color: Colors.white, fontSize: 15.0),
                        );
                      case ChatMessageType.Image:
                        return CachedNetworkImage(
                          imageUrl: message.content,
                          imageBuilder: (ctx, imageProvider) => GestureDetector(
                            onTap: () => showDialog(
                              context: context,
                              builder: (ctx) =>
                                  FullSizeImageScreen(imageUrl: message.content),
                            ),
                            child: Container(
                              height: 150.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          placeholder: (ctx, url) => SpinKitPulse(
                            size: 35.0,
                            color: Theme.of(ctx).primaryIconTheme.color,
                          ),
                          errorWidget: (ctx, url, error) =>
                              Text(S.of(context).chatImageLoadFailed),
                        );
                      default:
                        return Text(S.of(context).chatContentNotRendered);
                    }
                  },
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

/// Widget used to display an image across the entire screen.
class FullSizeImageScreen extends StatelessWidget {
  /// The URL of the image. Cannot be null.
  final String imageUrl;

  const FullSizeImageScreen({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.70,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (ctx, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.contain,
              ),
            ),
          ),
          placeholder: (ctx, url) => SpinKitPulse(
            size: 65.0,
            color: Theme.of(ctx).primaryIconTheme.color,
          ),
          errorWidget: (ctx, url, error) => Text(S.of(context).chatImageLoadFailed),
        ),
      ),
    );
  }
}
