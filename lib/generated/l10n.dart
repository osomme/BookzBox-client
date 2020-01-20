// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

  String get appName {
    return Intl.message(
      'BookzBox',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  String get authUsername {
    return Intl.message(
      'Username',
      name: 'authUsername',
      desc: '',
      args: [],
    );
  }

  String get authPassword {
    return Intl.message(
      'Password',
      name: 'authPassword',
      desc: '',
      args: [],
    );
  }

  String get authEmail {
    return Intl.message(
      'E-mail',
      name: 'authEmail',
      desc: '',
      args: [],
    );
  }

  String get authNavToRegistration {
    return Intl.message(
      'Create new account',
      name: 'authNavToRegistration',
      desc: '',
      args: [],
    );
  }

  String get authNavToLogIn {
    return Intl.message(
      'Log in with existing account',
      name: 'authNavToLogIn',
      desc: '',
      args: [],
    );
  }

  String get authLogInBtn {
    return Intl.message(
      'Log In',
      name: 'authLogInBtn',
      desc: '',
      args: [],
    );
  }

  String get authRegisterBtn {
    return Intl.message(
      'Register',
      name: 'authRegisterBtn',
      desc: '',
      args: [],
    );
  }

  String get authSelectGoogle {
    return Intl.message(
      'Log in with Google',
      name: 'authSelectGoogle',
      desc: '',
      args: [],
    );
  }

  String get authSelectFacebook {
    return Intl.message(
      'Log in with Facebook',
      name: 'authSelectFacebook',
      desc: '',
      args: [],
    );
  }

  String get authSelectEmail {
    return Intl.message(
      'Log in with Email',
      name: 'authSelectEmail',
      desc: '',
      args: [],
    );
  }

  String get authSelectNewAcct {
    return Intl.message(
      'Don\'t have an account? Create a new one',
      name: 'authSelectNewAcct',
      desc: '',
      args: [],
    );
  }

  String get authErrorEmailAlreadyUsed {
    return Intl.message(
      'Email has already been used',
      name: 'authErrorEmailAlreadyUsed',
      desc: '',
      args: [],
    );
  }

  String get authErrorInvalidEmail {
    return Intl.message(
      'Invalid email address',
      name: 'authErrorInvalidEmail',
      desc: '',
      args: [],
    );
  }

  String get authErrorWeakPassword {
    return Intl.message(
      'Password is too weak',
      name: 'authErrorWeakPassword',
      desc: '',
      args: [],
    );
  }

  String get authErrorUserNotFound {
    return Intl.message(
      'User not found',
      name: 'authErrorUserNotFound',
      desc: '',
      args: [],
    );
  }

  String get authErrorOperationNotAllowed {
    return Intl.message(
      'Operation not allowed',
      name: 'authErrorOperationNotAllowed',
      desc: '',
      args: [],
    );
  }

  String get authErrorCredsAlreadyExists {
    return Intl.message(
      'There already exists a user with that email address',
      name: 'authErrorCredsAlreadyExists',
      desc: '',
      args: [],
    );
  }

  String get authErrorWrongPassword {
    return Intl.message(
      'Wrong password',
      name: 'authErrorWrongPassword',
      desc: '',
      args: [],
    );
  }

  String get authErrorTooManyReqs {
    return Intl.message(
      'You have attempted to sign in too many times',
      name: 'authErrorTooManyReqs',
      desc: '',
      args: [],
    );
  }

  String get authErrorUnknown {
    return Intl.message(
      'Unknown error',
      name: 'authErrorUnknown',
      desc: '',
      args: [],
    );
  }

  String get newBoxCloseText {
    return Intl.message(
      'Close',
      name: 'newBoxCloseText',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('en', ''),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}