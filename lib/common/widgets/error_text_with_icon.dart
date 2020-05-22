import 'package:flutter/material.dart';

/// A widget for showing error text along with an icon.
class ErrorTextWithIcon extends StatelessWidget {
  final String text;
  final Icon icon;
  final Color textColor;

  const ErrorTextWithIcon({Key key, @required this.text, @required this.icon, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: icon,
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: textColor ?? Colors.grey[600],
            ),
          )
        ],
      ),
    );
  }
}
