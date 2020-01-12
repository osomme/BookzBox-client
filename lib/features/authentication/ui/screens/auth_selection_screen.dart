import 'package:bookzbox/features/authentication/ui/screens/auth_loading_screen.dart';
import 'package:bookzbox/features/authentication/ui/widgets/main_content_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AuthSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthLoadingScreen(
      children: <Widget>[
        Padding(
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
                    onPressed: () => print('Clicked email'),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.email),
                        SizedBox(width: 5),
                        Text('Log in with Email'),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  RaisedButton(
                    onPressed: () => print('Clicked google'),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          AntDesign.google,
                          color: Colors.red[700],
                        ),
                        SizedBox(width: 5),
                        Text('Log in with Google'),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  RaisedButton(
                    onPressed: () => print('Clicked facebook -- not implemented yet'),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Entypo.facebook,
                          color: Colors.blue[900],
                        ),
                        SizedBox(width: 5),
                        Text('Log in with Facebook'),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () => print('Pressed new account'),
                    child: Text(
                      'Don\'t have an account? Create a new one',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.lightBlue[300],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
