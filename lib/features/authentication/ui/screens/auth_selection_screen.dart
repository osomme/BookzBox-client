import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/common/widgets/keys.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/authentication/ui/screens/auth_loading_screen.dart';
import 'package:bookzbox/features/authentication/ui/widgets/main_content_card.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AuthSelectionScreen extends StatelessWidget {
  final AuthStore authStore;
  final IAuthErrorParser errorParser;

  const AuthSelectionScreen({Key key, @required this.authStore, @required this.errorParser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthLoadingScreen(
      children: <Widget>[
        Observer(
          builder: (_) => Center(
            child: authStore.isLoading
                ? SizedBox(
                    height: 64.0,
                    width: 64.0,
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: MainContentCard(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 22.0,
                          left: 32.0,
                          right: 32.0,
                          bottom: 12.0,
                        ),
                        child: Column(
                          children: <Widget>[
                            RaisedButton(
                              key: Key(Keys.authSelectEmailBtnKey),
                              onPressed: authStore.isLoading
                                  ? null
                                  : () => Navigator.pushNamed(context, Screens.emailLogin),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.email),
                                  SizedBox(width: 5),
                                  Text(S.of(context).authSelectEmail),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            RaisedButton(
                              onPressed: authStore.isLoading ? null : authStore.signInWithGoogle,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    AntDesign.google,
                                    color: Colors.red[700],
                                  ),
                                  SizedBox(width: 5),
                                  Text(S.of(context).authSelectGoogle),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            RaisedButton(
                              onPressed: authStore.isLoading
                                  ? null
                                  : () => print('Clicked facebook -- not implemented yet'),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Entypo.facebook,
                                    color: Colors.blue[900],
                                  ),
                                  SizedBox(width: 5),
                                  Text(S.of(context).authSelectFacebook),
                                ],
                              ),
                            ),
                            authStore.errorMessage != null
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 7.0),
                                    child: Text(
                                      errorParser.messageFrom(
                                        authStore.errorMessage,
                                        context,
                                      ),
                                      style: TextStyle(color: Theme.of(context).errorColor),
                                    ),
                                  )
                                : SizedBox.shrink(),
                            FlatButton(
                              key: Key(Keys.newAccountNavButtonKey),
                              onPressed: authStore.isLoading
                                  ? null
                                  : () => Navigator.pushNamed(context, Screens.emailNewAccount),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    S.of(context).authSelectNewAcct,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    S.of(context).authNewAccountNavigate,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
