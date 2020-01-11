import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onClicked;
  final String labelText;
  final Color _buttonColor = Color.fromRGBO(238, 64, 106, 1.0);
  final BorderRadiusGeometry _borderRadius = BorderRadius.circular(30.0);

  AuthButton({
    Key key,
    @required this.onClicked,
    @required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      height: 45.0,
      child: Container(
        decoration: BoxDecoration(
          color: _buttonColor,
          borderRadius: _borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 5.0,
            ),
          ],
        ),
        child: RaisedButton(
          onPressed: onClicked,
          shape: RoundedRectangleBorder(
            borderRadius: _borderRadius,
          ),
          color: _buttonColor,
          child: Text(
            labelText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
