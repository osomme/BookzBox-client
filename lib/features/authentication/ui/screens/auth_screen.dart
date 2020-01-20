import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/authentication/ui/screens/auth_loading_screen.dart';
import 'package:flutter/material.dart';

class FormFieldData {
  final Function(String value) onChanged;
  final Icon prefixIcon;
  final Icon suffixIcon;
  final String errorText;
  final String labelText;
  final bool isPassword;
  final TextInputType type;

  FormFieldData(
      {@required this.onChanged,
      @required this.prefixIcon,
      @required this.errorText,
      @required this.labelText,
      this.isPassword = false,
      this.type = TextInputType.text,
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
  final String errorMessage;

  const AuthScreen(
      {Key key,
      @required this.onSubmitPressed,
      @required this.onNavigationPressed,
      @required this.submitButtonText,
      @required this.navigationButtonText,
      @required this.fields,
      @required this.formIsValid,
      @required this.isLoading,
      this.errorMessage})
      : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return AuthLoadingScreen(
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: AuthInputCard(
                formFields: widget.fields,
                navigationButtonLabel: widget.navigationButtonText,
                onNavigationPressed: widget.onNavigationPressed,
                errorMessage: widget.errorMessage,
              ),
            ),
            Positioned.directional(
              textDirection: TextDirection.ltr,
              bottom: -15,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: AuthButton(
                  onClicked: widget.formIsValid ? widget.onSubmitPressed : null,
                  labelText: widget.submitButtonText,
                  isLoading: widget.isLoading,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
