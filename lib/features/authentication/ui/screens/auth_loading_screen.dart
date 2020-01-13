import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AuthLoadingScreen extends StatelessWidget {
  final List<Widget> children;

  AuthLoadingScreen({@required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 46, 58, 1.0),
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
                      color: Color.fromRGBO(239, 177, 130, 1.0),
                    ),
                    Text(
                      S.of(context).appName,
                      style: TextStyle(
                        color: Color.fromRGBO(239, 177, 130, 1.0),
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
