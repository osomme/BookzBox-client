import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AuthLoadingScreen extends StatelessWidget {
  final List<Widget> children;

  AuthLoadingScreen({@required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 75.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Entypo.book,
                      size: 60,
                      color: Theme.of(context).accentColor,
                    ),
                    Text(
                      S.of(context).appName,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontFamily: 'Indie Flower',
                        fontSize: 46.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              ...children,
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}