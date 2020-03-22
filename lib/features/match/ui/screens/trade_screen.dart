import 'package:flutter/material.dart';

class TradeScreen extends StatefulWidget {
  final String matchId;
  final String clientUserId;

  const TradeScreen({
    Key key,
    @required this.matchId,
    @required this.clientUserId,
  }) : super(key: key);

  @override
  _TradeScreenState createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
