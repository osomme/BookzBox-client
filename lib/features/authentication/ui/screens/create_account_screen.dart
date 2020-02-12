import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CreateAccountScreen extends StatefulWidget {
  final AuthStore authStore;
  final NewAccountStore credStore;
  final IAuthErrorParser errorParser;
  CreateAccountScreen(this.authStore, this.credStore, this.errorParser);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  void _registerUser() async {
    FocusScope.of(context).unfocus(); // Hides soft keyboard
    await widget.authStore.registerUser(
        widget.credStore.username, widget.credStore.email, widget.credStore.password);
    if (widget.authStore.isLoggedIn) {
      widget.credStore.reset();
      Navigator.popUntil(context, (s) => s.isFirst);
    }
  }

  List<FormFieldData> _createFormFields() {
    return [
      FormFieldData(
        labelText: S.of(context).authUsername,
        prefixIcon: Icon(Icons.person),
        errorText: widget.credStore.usernameError,
        onChanged: (value) => widget.credStore.setUsername(value),
      ),
      FormFieldData(
        labelText: S.of(context).authEmail,
        prefixIcon: Icon(Icons.email),
        errorText: widget.credStore.emailError,
        onChanged: (value) => widget.credStore.setEmail(value),
        type: TextInputType.emailAddress,
      ),
      FormFieldData(
        labelText: S.of(context).authPassword,
        isPassword: true,
        prefixIcon: Icon(Icons.lock),
        errorText: widget.credStore.passwordError,
        onChanged: (value) => widget.credStore.setPassword(value),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return AuthScreen(
          fields: _createFormFields(),
          onNavigationPressed: () {
            widget.authStore.clearError();
            return Navigator.pushNamed(context, Screens.emailLogin);
          },
          formIsValid: widget.credStore.credentialsAreValid,
          navigationButtonText: S.of(context).authNavToLogIn,
          submitButtonText: S.of(context).authRegisterBtn,
          onSubmitPressed: _registerUser,
          isLoading: widget.authStore.isLoading,
          errorMessage: widget.authStore.errorMessage != null
              ? widget.errorParser.messageFrom(widget.authStore.errorMessage, context)
              : null,
        );
      },
    );
  }
}
