import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';

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
                child: SvgPicture.asset(
                  'assets/images/bb_ikon_og_tekst.svg',
                  height: 186,
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
