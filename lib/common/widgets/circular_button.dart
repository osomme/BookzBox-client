import 'package:flutter/material.dart';

/// A material button with circular shape.
class CircularButton extends StatelessWidget {
  const CircularButton({
    Key key,
    @required this.child,
    @required this.label,
    @required this.onClick,
    this.textColor = Colors.white,
    this.padding = 10.0,
  }) : super(key: key);

  final Widget child;

  /// The text to show on this button.
  final String label;

  /// The action to execute when this button is tapped.
  final Function onClick;

  /// The color of the [label].
  final Color textColor;

  final double padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RawMaterialButton(
          padding: EdgeInsets.all(padding),
          shape: CircleBorder(),
          elevation: 2.0,
          fillColor: Theme.of(context).accentColor,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).accentColor,
                  blurRadius: 9.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: child,
          ),
          onPressed: onClick,
        ),
        SizedBox(height: 5.0),
        Text(
          label,
          style: TextStyle(color: textColor),
        ),
      ],
    );
  }
}
