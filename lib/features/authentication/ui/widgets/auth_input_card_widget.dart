import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:flutter/material.dart';

class AuthInputCard extends StatelessWidget {
  final List<FormFieldData> formFields;
  final Function onNavigationPressed;
  final String navigationButtonLabel;

  const AuthInputCard({
    Key key,
    @required this.formFields,
    @required this.onNavigationPressed,
    @required this.navigationButtonLabel,
  }) : super(key: key);

  List<Widget> mapFields() {
    return formFields.map((field) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 14.0),
        child: TextField(
          onChanged: field.onChanged,
          obscureText: field.isPassword ? true : false,
          decoration: InputDecoration(
            prefixIcon: field.prefixIcon,
            suffixIcon: field.suffixIcon,
            labelText: field.labelText,
            errorText: field.errorText,
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MainContentCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 25),
            Form(
              child: Column(
                children: <Widget>[
                  ...mapFields(),
                  SizedBox(height: 14.0),
                  FlatButton(
                    onPressed: onNavigationPressed,
                    child: Text(
                      navigationButtonLabel,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.lightBlue[300],
                      ),
                    ),
                  ),
                  SizedBox(height: 35.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
