import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/common/widgets/keys.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:bookzbox/features/authentication/authentication.dart';

class LoginScreen extends StatefulWidget {
  final AuthStore authStore;
  final LoginCredentialsStore credStore;
  final IAuthErrorParser errorParser;

  LoginScreen(this.authStore, this.credStore, this.errorParser);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _logIn() async {
    FocusScope.of(context).unfocus(); // Hides soft keyboard
    await widget.authStore.signInWithEmail(widget.credStore.email, widget.credStore.password);
    if (widget.authStore.isLoggedIn) {
      widget.credStore.reset();
      Navigator.popUntil(context, (s) => s.isFirst);
    }
  }

  List<FormFieldData> _createFormFields() {
    return [
      FormFieldData(
        key: Key(Keys.emailInputFieldKey),
        labelText: S.of(context).authEmail,
        prefixIcon: Icon(Icons.email),
        errorText: widget.credStore.emailError,
        onChanged: (value) => widget.credStore.setEmail(value),
        type: TextInputType.emailAddress,
      ),
      FormFieldData(
        key: Key(Keys.passwordInputFieldKey),
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
        key: Key(Keys.loginWithEmailScreenKey),
        fields: _createFormFields(),
        onNavigationPressed: () {
          widget.authStore.clearError();
          return Navigator.pushNamed(context, Screens.emailNewAccount);
        },
        formIsValid: widget.credStore.credentialsAreValid,
        navigationButtonText: S.of(context).authNavToRegistration,
        submitButtonText: S.of(context).authLogInBtn,
        submitButtonKey: Key(Keys.loginBtnKey),
        onSubmitPressed: _logIn,
        isLoading: widget.authStore.isLoading,
        errorMessage: widget.authStore.errorMessage != null
            ? widget.errorParser.messageFrom(widget.authStore.errorMessage, context)
            : null,
      ),
    );
  }
}
