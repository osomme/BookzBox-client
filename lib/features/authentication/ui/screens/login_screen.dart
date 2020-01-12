import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:bookzbox/features/authentication/authentication.dart';

class LoginScreen extends StatefulWidget {
  final AuthStore authStore;
  final LoginCredentialsStore credStore;
  LoginScreen(this.authStore, this.credStore);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _navigateToMainScreen() {
    FocusScope.of(context).unfocus();
    widget.authStore.signInWithEmail(widget.credStore.email, widget.credStore.password);
    widget.credStore.reset();
    Navigator.pop(context);
  }

  List<FormFieldData> _createFormFields() {
    return [
      FormFieldData(
        labelText: S.of(context).authEmail,
        isPassword: false,
        prefixIcon: Icon(Icons.email),
        errorText: widget.credStore.emailError,
        onChanged: (value) => widget.credStore.setEmail(value),
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
      builder: (_) => AuthScreen(
        fields: _createFormFields(),
        onNavigationPressed: () => Navigator.pushNamed(context, 'email_new_account'),
        formIsValid: widget.credStore.credentialsAreValid,
        navigationButtonText: S.of(context).authNavToRegistration,
        submitButtonText: S.of(context).authLogInBtn,
        onSubmitPressed: _navigateToMainScreen,
        isLoading: widget.authStore.isLoading,
      ),
    );
  }
}
