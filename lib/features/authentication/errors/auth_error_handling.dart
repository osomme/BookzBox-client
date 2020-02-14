import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';

abstract class IAuthErrorParser {
  String messageFrom(String errorCode, BuildContext ctx);
}

class FirebaseErrorParser implements IAuthErrorParser {
  /// Converts Firebase error codes into human readable strings.
  /// The Firebase error codes are poorly documented but relevant ones can be found in the method
  /// descriptions found here: https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth-class.html
  @override
  String messageFrom(String errorCode, BuildContext ctx) {
    print('[AUTH ERROR] code: $errorCode');
    switch (errorCode) {
      case 'ERROR_EMAIL_ALREADY_IN_USE': // Email has already been used by a different account.
        return S.of(ctx).authErrorEmailAlreadyUsed;
      case 'ERROR_INVALID_EMAIL': // Email is malformed.
        return S.of(ctx).authErrorInvalidEmail;
      case 'ERROR_WEAK_PASSWORD': // Password is not strong enough.
        return S.of(ctx).authErrorWeakPassword;
      case 'ERROR_USER_NOT_FOUND': // User account not found
        return S.of(ctx).authErrorUserNotFound;
      case 'ERROR_OPERATION_NOT_ALLOWED': // Operation not allowed. Can happen when login provider is not enabled.
        return S.of(ctx).authErrorOperationNotAllowed;
      case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL': // A user already exists with the same email address but different provider (email, google, facebook, etc.).
        return S.of(ctx).authErrorCredsAlreadyExists;
      case 'ERROR_INVALID': // The email address is invalid
        return S.of(ctx).authErrorInvalidEmail;
      case 'ERROR_WRONG_PASSWORD': // Wrong password for the particular email.
        return S.of(ctx).authErrorWrongPassword;
      case 'ERROR_TOO_MANY_REQUESTS': // User has attempted to log in too many times.
        return S.of(ctx).authErrorTooManyReqs;
      case 'sign_in_canceled': // User cancelled their Google auth login window.
        return '';
      default:
        return S.of(ctx).authErrorUnknown;
    }
  }
}
