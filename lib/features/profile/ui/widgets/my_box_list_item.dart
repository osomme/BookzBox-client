import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/box/models/my_box.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:bookzbox/features/box/helpers/status_extensions.dart';

class MyBoxListItem extends StatelessWidget {
  static const TextStyle cardTitleStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 18,
    letterSpacing: 1.05,
    shadows: <Shadow>[Shadow(color: Colors.black54, blurRadius: 2.0, offset: Offset(1, 1))],
  );

  final MyBox box;
  final VoidCallback onChangeVisibilityPressed;
  final bool isMyBox;

  MyBoxListItem({
    @required this.onChangeVisibilityPressed,
    @required this.box,
    @required this.isMyBox,
  });

  bool shouldGetInMinutes(DateTime time) {
    return DateTime.now().difference(time).inMinutes < 60;
  }

  bool shouldGetInHours(DateTime time) {
    return DateTime.now().difference(time).inHours < 24;
  }

  String getDaysSinceString(BuildContext ctx, DateTime time) {
    if (shouldGetInMinutes(time)) {
      return S.of(ctx).boxPublishedMinAgo(DateTime.now().difference(time).inMinutes);
    } else if (shouldGetInHours(time)) {
      return S.of(ctx).boxPublishedHoursAgo(DateTime.now().difference(time).inHours);
    } else {
      return S.of(ctx).boxPublishedDaysAgo(DateTime.now().difference(time).inDays);
    }
  }

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
                            style: cardTitleStyle,
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
                                    getDaysSinceString(context, box.publishDateTime),
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
                  (isMyBox
                      ? Expanded(
                          child: FlatButton(
                            onPressed: onChangeVisibilityPressed,
                            child: Text(
                              S.of(context).profileChangeVisibilityBtn,
                              style: TextStyle(
                                color: Colors.purple[200],
                              ),
                            ),
                          ),
                        )
                      : Spacer()),
                  Expanded(
                    child: FlatButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Screens.boxDetails, arguments: box.id),
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
