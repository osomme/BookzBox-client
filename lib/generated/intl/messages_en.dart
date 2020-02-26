// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static m0(amount) => "${Intl.plural(amount, one: '1 day ago', other: '${amount} days ago')}";

  static m1(amount) => "${Intl.plural(amount, one: '1 day ago', other: '${amount} days ago')}";

  static m2(numMin) => "${numMin} min ago";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appName" : MessageLookupByLibrary.simpleMessage("BookzBox"),
    "authEmail" : MessageLookupByLibrary.simpleMessage("E-mail"),
    "authErrorCredsAlreadyExists" : MessageLookupByLibrary.simpleMessage("There already exists a user with that email address"),
    "authErrorEmailAlreadyUsed" : MessageLookupByLibrary.simpleMessage("Email has already been used"),
    "authErrorInvalidEmail" : MessageLookupByLibrary.simpleMessage("Invalid email address"),
    "authErrorOperationNotAllowed" : MessageLookupByLibrary.simpleMessage("Operation not allowed"),
    "authErrorTooManyReqs" : MessageLookupByLibrary.simpleMessage("You have attempted to sign in too many times"),
    "authErrorUnknown" : MessageLookupByLibrary.simpleMessage("Unknown error"),
    "authErrorUserNotFound" : MessageLookupByLibrary.simpleMessage("User not found"),
    "authErrorWeakPassword" : MessageLookupByLibrary.simpleMessage("Password is too weak"),
    "authErrorWrongPassword" : MessageLookupByLibrary.simpleMessage("Wrong password"),
    "authLogInBtn" : MessageLookupByLibrary.simpleMessage("Log In"),
    "authNavToLogIn" : MessageLookupByLibrary.simpleMessage("Log in with existing account"),
    "authNavToRegistration" : MessageLookupByLibrary.simpleMessage("Create new account"),
    "authNewAccountNavigate" : MessageLookupByLibrary.simpleMessage("Create a new one"),
    "authPassword" : MessageLookupByLibrary.simpleMessage("Password"),
    "authRegisterBtn" : MessageLookupByLibrary.simpleMessage("Register"),
    "authSelectEmail" : MessageLookupByLibrary.simpleMessage("Log in with Email"),
    "authSelectFacebook" : MessageLookupByLibrary.simpleMessage("Log in with Facebook"),
    "authSelectGoogle" : MessageLookupByLibrary.simpleMessage("Log in with Google"),
    "authSelectNewAcct" : MessageLookupByLibrary.simpleMessage("Don\'t have an account? "),
    "authUsername" : MessageLookupByLibrary.simpleMessage("Username"),
    "boxCancelVisibilityChange" : MessageLookupByLibrary.simpleMessage("CANCEL"),
    "boxConfirmVisibilityChange" : MessageLookupByLibrary.simpleMessage("CONFIRM"),
    "boxPublishedDaysAgo" : m0,
    "boxPublishedHoursAgo" : m1,
    "boxPublishedMinAgo" : m2,
    "boxStatusPrivate" : MessageLookupByLibrary.simpleMessage("PRIVATE"),
    "boxStatusPrivateDesc" : MessageLookupByLibrary.simpleMessage("Only you can see this box."),
    "boxStatusPublic" : MessageLookupByLibrary.simpleMessage("PUBLIC"),
    "boxStatusPublicDesc" : MessageLookupByLibrary.simpleMessage("Everyone can see this box."),
    "boxStatusTraded" : MessageLookupByLibrary.simpleMessage("TRADED"),
    "boxVisibilityChangeDialogTitle" : MessageLookupByLibrary.simpleMessage("Change box visibility"),
    "feedBooks" : MessageLookupByLibrary.simpleMessage("BOOKS"),
    "feedDescription" : MessageLookupByLibrary.simpleMessage("Description"),
    "feedLocation" : MessageLookupByLibrary.simpleMessage("LOCATION"),
    "feedNoBoxesFound" : MessageLookupByLibrary.simpleMessage("No boxes found... Try changing your preferences!"),
    "feedNoDescription" : MessageLookupByLibrary.simpleMessage("No description"),
    "feedNoLocationData" : MessageLookupByLibrary.simpleMessage("No data"),
    "feedTitle" : MessageLookupByLibrary.simpleMessage("Top Boxes"),
    "homeNavBarActivityLabel" : MessageLookupByLibrary.simpleMessage("Activity"),
    "homeNavBarFeedLabel" : MessageLookupByLibrary.simpleMessage("Feed"),
    "homeNavBarMapLabel" : MessageLookupByLibrary.simpleMessage("Map"),
    "homeNavBarProfileLabel" : MessageLookupByLibrary.simpleMessage("Profile"),
    "mapDescription" : MessageLookupByLibrary.simpleMessage("Description"),
    "mapDetailsLabel" : MessageLookupByLibrary.simpleMessage("Details"),
    "mapErrorBoxesError" : MessageLookupByLibrary.simpleMessage("Failed to retrieve boxes"),
    "mapErrorNoLocationPermission" : MessageLookupByLibrary.simpleMessage("Location permissions must be enabled"),
    "mapLikeLabel" : MessageLookupByLibrary.simpleMessage("Like"),
    "mapNoDescription" : MessageLookupByLibrary.simpleMessage("No description"),
    "mapNoImages" : MessageLookupByLibrary.simpleMessage("No Images"),
    "mapProfileLabel" : MessageLookupByLibrary.simpleMessage("Profile"),
    "mapPublishedOn" : MessageLookupByLibrary.simpleMessage("Published"),
    "newBoxAddBookButton" : MessageLookupByLibrary.simpleMessage("ADD BOOK"),
    "newBoxBookAuthor" : MessageLookupByLibrary.simpleMessage("Author"),
    "newBoxBookNotFound" : MessageLookupByLibrary.simpleMessage("Book not found"),
    "newBoxBookPublished" : MessageLookupByLibrary.simpleMessage("Published"),
    "newBoxBooksTitle" : MessageLookupByLibrary.simpleMessage("Books"),
    "newBoxCancelDialog" : MessageLookupByLibrary.simpleMessage("CANCEL"),
    "newBoxCloseTip" : MessageLookupByLibrary.simpleMessage("Close"),
    "newBoxDescriptionTitle" : MessageLookupByLibrary.simpleMessage("Description"),
    "newBoxFieldPlaceholder" : MessageLookupByLibrary.simpleMessage("Unknown"),
    "newBoxFindBook" : MessageLookupByLibrary.simpleMessage("FIND BOOK"),
    "newBoxInfo" : MessageLookupByLibrary.simpleMessage("Creating a box is easy. First, add the books you want to trade. Second, write a catchy title and a short description. Finally, publish!"),
    "newBoxInvalidTitle" : MessageLookupByLibrary.simpleMessage("Title must be at least 4 characters long"),
    "newBoxIsPublishing" : MessageLookupByLibrary.simpleMessage("Publishing.."),
    "newBoxIsbnDialogTitle" : MessageLookupByLibrary.simpleMessage("Enter ISBN"),
    "newBoxIsbnInvalid" : MessageLookupByLibrary.simpleMessage("Invalid ISBN"),
    "newBoxNoBooks" : MessageLookupByLibrary.simpleMessage("A box must have at least 1 book"),
    "newBoxPublishTip" : MessageLookupByLibrary.simpleMessage("Publish"),
    "newBoxRemoveBook" : MessageLookupByLibrary.simpleMessage("Delete"),
    "newBoxTitle" : MessageLookupByLibrary.simpleMessage("Create a box"),
    "newBoxTitleTitle" : MessageLookupByLibrary.simpleMessage("Title"),
    "profileBoxDetailsBtn" : MessageLookupByLibrary.simpleMessage("DETAILS"),
    "profileBoxesTabLabel" : MessageLookupByLibrary.simpleMessage("MY BOXES"),
    "profileChangeVisibilityBtn" : MessageLookupByLibrary.simpleMessage("CHANGE VISIBILITY"),
    "profileJoinDateTitle" : MessageLookupByLibrary.simpleMessage("Member since"),
    "profileLogout" : MessageLookupByLibrary.simpleMessage("Log out"),
    "profileMeTabLabel" : MessageLookupByLibrary.simpleMessage("ME"),
    "profileNewBoxFAB" : MessageLookupByLibrary.simpleMessage("NEW BOX"),
    "profileNewBoxTitle" : MessageLookupByLibrary.simpleMessage("New box"),
    "profilePreferencesTabLabel" : MessageLookupByLibrary.simpleMessage("PREFERENCES"),
    "profileRatingCardSubTitle" : MessageLookupByLibrary.simpleMessage("The rating is based on the feedback left by other users after a trade or interaction."),
    "profileRatingCardTitle" : MessageLookupByLibrary.simpleMessage("Rating"),
    "profileTradesTitle" : MessageLookupByLibrary.simpleMessage("Trades")
  };
}
