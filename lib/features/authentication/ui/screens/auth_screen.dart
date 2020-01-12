import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FormFieldData {
  final Function(String value) onChanged;
  final Icon prefixIcon;
  final Icon suffixIcon;
  final String errorText;
  final String labelText;
  final bool isPassword;

  FormFieldData(
      {@required this.onChanged,
      @required this.prefixIcon,
      @required this.errorText,
      @required this.labelText,
      @required this.isPassword,
      this.suffixIcon});
}

class AuthScreen extends StatefulWidget {
  final VoidCallback onSubmitPressed;
  final VoidCallback onNavigationPressed;
  final String submitButtonText;
  final String navigationButtonText;
  final List<FormFieldData> fields;
  final bool formIsValid;
  final bool isLoading;

  const AuthScreen(
      {Key key,
      @required this.onSubmitPressed,
      @required this.onNavigationPressed,
      @required this.submitButtonText,
      @required this.navigationButtonText,
      @required this.fields,
      @required this.formIsValid,
      @required this.isLoading})
      : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 46, 58, 1.0),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
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
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: AuthInputCard(
                      formFields: widget.fields,
                      navigationButtonLabel: widget.navigationButtonText,
                      onNavigationPressed: widget.onNavigationPressed,
                    ),
                  ),
                  Positioned.directional(
                    textDirection: TextDirection.ltr,
                    bottom: -15,
                    start: 70,
                    child: AuthButton(
                      onClicked: widget.formIsValid ? widget.onSubmitPressed : null,
                      labelText: widget.submitButtonText,
                      isLoading: widget.isLoading,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
