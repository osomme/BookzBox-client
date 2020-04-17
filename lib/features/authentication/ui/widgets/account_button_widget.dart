import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onClicked;
  final String labelText;
  final bool isLoading;
  final BorderRadiusGeometry _borderRadius = BorderRadius.circular(30.0);
  final Key buttonKey;

  AuthButton({
    Key widgetKey,
    @required this.onClicked,
    @required this.labelText,
    @required this.isLoading,
    @required this.buttonKey,
  }) : super(key: widgetKey);

  @override
  Widget build(BuildContext context) {
    final _buttonColor = Theme.of(context).accentColor;
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
          key: buttonKey,
          onPressed: isLoading ? null : onClicked,
          shape: RoundedRectangleBorder(
            borderRadius: _borderRadius,
          ),
          color: _buttonColor,
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : Text(
                  labelText,
                  style: Theme.of(context).accentTextTheme.button,
                ),
        ),
      ),
    );
  }
}
