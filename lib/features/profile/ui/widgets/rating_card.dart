import 'package:bookzbox/features/profile/style/profile_card_style.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

// A widget displaying a profiles rating.
class RatingCard extends StatelessWidget {
  static const TextStyle mainContentStyle = TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.w800,
    letterSpacing: 1.2,
    shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 2.0, offset: Offset(1, 1))],
    fontSize: 48,
  );

  final int rating;

  RatingCard({
    Key key,
    @required this.rating,
  }) : super(key: key);

  String getRatingText() {
    if (rating == 0) {
      return rating.toString();
    }
    return (rating > 0 ? '+' + rating.toString() : rating.toString());
  }

  Color getRatingColor() {
    if (rating == 0) {
      return Colors.white;
    }
    return (rating > 0 ? Colors.green : Colors.red);
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
                  margin: const EdgeInsets.only(top: 12, bottom: 8),
                  child: Text(
                    S.of(context).profileRatingCardTitle,
                    style: ProfileCardStyle.cardTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: Icon(
                            MaterialIcons.info_outline,
                            color: Color(0xFFEEEEEE),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            S.of(context).profileRatingCardSubTitle,
                            style: ProfileCardStyle.cardSubTitleStyle,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 24),
                  child: Text(
                    getRatingText(),
                    style: mainContentStyle.apply(color: getRatingColor()),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
