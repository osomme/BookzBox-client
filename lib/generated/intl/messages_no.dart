// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a no locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'no';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "authEmail" : MessageLookupByLibrary.simpleMessage("E-post"),
    "authErrorCredsAlreadyExists" : MessageLookupByLibrary.simpleMessage("Det eksisterer allerede en bruker med den E-post addressen"),
    "authErrorEmailAlreadyUsed" : MessageLookupByLibrary.simpleMessage("E-posten har allerede blitt brukt"),
    "authErrorInvalidEmail" : MessageLookupByLibrary.simpleMessage("Ugyldig E-post addresse"),
    "authErrorOperationNotAllowed" : MessageLookupByLibrary.simpleMessage("Handlingen ikke godkjent"),
    "authErrorTooManyReqs" : MessageLookupByLibrary.simpleMessage("Du har forsøkt å logge inn for mange ganger"),
    "authErrorUnknown" : MessageLookupByLibrary.simpleMessage("Ukjent feil"),
    "authErrorUserNotFound" : MessageLookupByLibrary.simpleMessage("Kunne ikke finne brukeren"),
    "authErrorWeakPassword" : MessageLookupByLibrary.simpleMessage("Passordet er ikke sterkt nok"),
    "authErrorWrongPassword" : MessageLookupByLibrary.simpleMessage("Feil passord"),
    "authLogInBtn" : MessageLookupByLibrary.simpleMessage("Logg inn"),
    "authNavToLogIn" : MessageLookupByLibrary.simpleMessage("Logg inn med eksisterende konto"),
    "authNavToRegistration" : MessageLookupByLibrary.simpleMessage("Lag ny konto"),
    "authNewAccountNavigate" : MessageLookupByLibrary.simpleMessage("Lag en ny"),
    "authPassword" : MessageLookupByLibrary.simpleMessage("Passord"),
    "authRegisterBtn" : MessageLookupByLibrary.simpleMessage("Registrer"),
    "authSelectEmail" : MessageLookupByLibrary.simpleMessage("Logg inn med E-post"),
    "authSelectFacebook" : MessageLookupByLibrary.simpleMessage("Logg inn med Facebook"),
    "authSelectGoogle" : MessageLookupByLibrary.simpleMessage("Logg inn med Google"),
    "authSelectNewAcct" : MessageLookupByLibrary.simpleMessage("Har du ikke en konto? "),
    "authUsername" : MessageLookupByLibrary.simpleMessage("Brukernavn")
  };
}
