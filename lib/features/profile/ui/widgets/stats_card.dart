import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  static const TextStyle cardTitleStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    letterSpacing: 1.05,
    shadows: <Shadow>[Shadow(color: Colors.black54, blurRadius: 2.0, offset: Offset(1, 1))],
  );

  static const TextStyle cardStatTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w800,
    letterSpacing: 1.2,
    shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 2.0, offset: Offset(1, 1))],
    fontSize: 48,
  );

  final String title;
  final String stat;

  StatsCard({
    Key key,
    this.title,
    this.stat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Text(
              title,
              style: cardTitleStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 16),
            child: Text(
              stat,
              style: cardStatTextStyle,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
