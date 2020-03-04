import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:bookzbox/features/box/helpers/status_extensions.dart';
import 'package:bookzbox/common/extensions/extensions.dart';

/// Creates a box list item.
/// [shouldShowLeftButton] must never be null.
/// [onLeftButtonPressed] cannot be null if [shouldShowLeftButton] is set to true.
/// [leftButtonText] cannot be null if [shouldShowLeftButton] is set to true.
class MiniBoxListItem extends StatelessWidget {
  final MiniBox box;
  final VoidCallback onLeftButtonPressed;
  final String leftButtonText;
  final bool shouldShowLeftButton;

  MiniBoxListItem({
    @required this.box,
    this.leftButtonText,
    this.onLeftButtonPressed,
    this.shouldShowLeftButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.5,
                      color: Colors.grey,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    (box.bookThumbnailUrl == null
                        ? Image.asset(
                            'assets/images/book_cover_placeholder.jpeg',
                            fit: BoxFit.fill,
                            width: 70,
                            height: 100,
                          )
                        : Image.network(
                            box.bookThumbnailUrl,
                            fit: BoxFit.fill,
                            width: 70,
                            height: 100,
                          )),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            box.title,
                            style: Theme.of(context).primaryTextTheme.subhead.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              letterSpacing: 1.05,
                              shadows: <Shadow>[
                                Shadow(
                                  color: Colors.black54,
                                  blurRadius: 2.0,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            overflow: TextOverflow.fade,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  MaterialCommunityIcons.eye,
                                  size: 24.0,
                                  color: Theme.of(context).accentColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Text(
                                    box.status.toLocalizedString(context).toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  MaterialCommunityIcons.cube_send,
                                  size: 24.0,
                                  color: Theme.of(context).accentColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Text(
                                    box.publishDateTime.toTimeDifferenceString(context),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  (shouldShowLeftButton
                      ? Expanded(
                          child: FlatButton(
                            onPressed: onLeftButtonPressed,
                            child: Text(
                              leftButtonText ?? '',
                              style: TextStyle(
                                color: Colors.purple[200],
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink()),
                  Expanded(
                    child: FlatButton(
                      onPressed: () => Navigator.pushNamed(context, Screens.boxDetails,
                          arguments: box.id),
                      child: Text(
                        S.of(context).profileBoxDetailsBtn,
                        style: TextStyle(
                          color: Colors.purple[200],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
