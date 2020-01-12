import 'package:flutter/material.dart';

class MainContentCard extends StatelessWidget {
  final Widget child;

  const MainContentCard({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: child,
    );
  }
}
