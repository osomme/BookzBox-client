import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CreateAccountScreen extends StatefulWidget {
  final AuthStore authStore;
  final NewAccountStore credStore;
  CreateAccountScreen(this.authStore, this.credStore);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  void _navigateToMainScreen() {
    FocusScope.of(context).unfocus();
    widget.authStore.registerUser(
        widget.credStore.username, widget.credStore.email, widget.credStore.password);
    widget.credStore.reset();
    Navigator.pop(context);
  }

  List<FormFieldData> _createFormFields() {
    return [
      FormFieldData(
        labelText: S.of(context).authUsername,
        isPassword: false,
        prefixIcon: Icon(Icons.person),
        errorText: widget.credStore.usernameError,
        onChanged: (value) => widget.credStore.setUsername(value),
      ),
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
        onNavigationPressed: () => Navigator.pop(context),
        formIsValid: widget.credStore.credentialsAreValid,
        navigationButtonText: S.of(context).authNavToRegistration,
        submitButtonText: S.of(context).authRegisterBtn,
        onSubmitPressed: _navigateToMainScreen,
      ),
    );
  }
}
