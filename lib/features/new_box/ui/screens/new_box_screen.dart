import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class NewBoxScreen extends StatefulWidget {
  @override
  _NewBoxScreenState createState() => _NewBoxScreenState();
}

class _NewBoxScreenState extends State<NewBoxScreen> {
  Container closeButton(BuildContext context) {
    return new Container(
      margin: EdgeInsets.fromLTRB(0.0, 24, 0.0, 0.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          icon: Icon(
            Icons.close,
            size: 24.0,
            color: Theme.of(context).accentColor,
          ),
          tooltip: S.of(context).newBoxCloseText,
          onPressed: () => setState(() => Navigator.pop(context)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(minWidth: double.infinity),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.25, 0.9),
              stops: [0.35, 0.4],
              colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).accentColor]),
        ),
        child: Column(
          children: <Widget>[
            closeButton(context),
          ],
        ),
      ),
    );
  }
}
