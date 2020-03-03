import 'package:bookzbox/features/profile/style/profile_card_style.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

/// A widget displaying when a user was last active.
/// Follows the style of the profile screen.
class ActivityStatusCard extends StatelessWidget {
  final DateTime lastSeen;

  ActivityStatusCard({
    Key key,
    @required this.lastSeen,
  }) : super(key: key);

  String getLastSeenString(BuildContext ctx) {
    if (DateTime.now().difference(lastSeen).inDays < 1) {
      // TODAY
      return S.of(ctx).profileLastSeenToday;
    } else if (DateTime.now().difference(lastSeen).inDays <= 2) {
      // YESTERDAY
      return S.of(ctx).profileLastSeenYesterday;
    } else {
      // MORE THAN TWO DAYS AGO
      return S.of(ctx).profileLastSeenDaysAgo(DateTime.now().difference(lastSeen).inDays);
    }
  }

  Color getStatusColor() {
    if (DateTime.now().difference(lastSeen).inMinutes < 15) {
      return Colors.green;
    } else if (DateTime.now().difference(lastSeen).inMinutes < 60) {
      return Colors.orangeAccent;
    } else {
      return Colors.grey[400];
    }
  }

  String getStatusString(BuildContext ctx) {
    if (DateTime.now().difference(lastSeen).inMinutes < 15) {
      return S.of(ctx).profileActivityStatusActive;
    } else if (DateTime.now().difference(lastSeen).inMinutes < 60) {
      return S.of(ctx).profileActivityStatusAway;
    } else {
      return S.of(ctx).profileActivityStatusOffline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            color: Theme.of(context).primaryColor,
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: Text(
                    S.of(context).profileActivityStatusCardTitle,
                    style: ProfileCardStyle.cardTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, right: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 4.0),
                          child: Icon(
                            Octicons.primitive_dot,
                            size: 32,
                            color: getStatusColor(),
                          ),
                        ),
                        Text(
                          getStatusString(context),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            shadows: <Shadow>[
                              Shadow(
                                color: Colors.black54,
                                blurRadius: 2.0,
                                offset: Offset(1, 1),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 16, left: 16),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          S.of(context).profileLastSeenText,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                        getLastSeenString(context),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
