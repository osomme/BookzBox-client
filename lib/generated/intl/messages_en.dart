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

  static m1(amount) => "${Intl.plural(amount, one: '1 hour ago', other: '${amount} hours ago')}";

  static m2(numMin) => "${numMin} min ago";

  static m3(amount) => "${Intl.plural(amount, one: '1 day ago', other: '${amount} days ago')}";

  static m4(amount) => "${Intl.plural(amount, one: '1 hour ago', other: '${amount} hours ago')}";

  static m5(amount) => "${Intl.plural(amount, one: '1 minute ago', other: '${amount} minutes ago')}";

  static m6(amount) => "${Intl.plural(amount, one: '1 second ago', other: '${amount} seconds ago')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "activityItemLikeMiddle" : MessageLookupByLibrary.simpleMessage(" liked your box: "),
    "activityItemMatchPost" : MessageLookupByLibrary.simpleMessage(" has matched with you"),
    "activityItemMessagePost" : MessageLookupByLibrary.simpleMessage(" wrote: "),
    "activityItemUnknown" : MessageLookupByLibrary.simpleMessage("Unknown activity"),
    "activityNewItem" : MessageLookupByLibrary.simpleMessage("New"),
    "activityScreenAppBarTitle" : MessageLookupByLibrary.simpleMessage("Recent activity"),
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
    "authErrorWrongPassword" : MessageLookupByLibrary.simpleMessage("Incorrect password"),
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
    "boxStatusPrivate" : MessageLookupByLibrary.simpleMessage("Private"),
    "boxStatusPrivateDesc" : MessageLookupByLibrary.simpleMessage("Only you can see this box."),
    "boxStatusPublic" : MessageLookupByLibrary.simpleMessage("Public"),
    "boxStatusPublicDesc" : MessageLookupByLibrary.simpleMessage("Everyone can see this box."),
    "boxStatusTraded" : MessageLookupByLibrary.simpleMessage("Traded"),
    "boxVisibilityChangeDialogTitle" : MessageLookupByLibrary.simpleMessage("Change box visibility"),
    "dateDaysAgo" : m3,
    "dateHoursAgo" : m4,
    "dateMinutesAgo" : m5,
    "dateSecondsAgo" : m6,
    "detailsAboutSeller" : MessageLookupByLibrary.simpleMessage("About the seller"),
    "detailsBookAuthor" : MessageLookupByLibrary.simpleMessage("Author"),
    "detailsBookCategories" : MessageLookupByLibrary.simpleMessage("Categories"),
    "detailsBookCondition" : MessageLookupByLibrary.simpleMessage("Condition"),
    "detailsBookNoSynopsis" : MessageLookupByLibrary.simpleMessage("No synopsis"),
    "detailsBookPages" : MessageLookupByLibrary.simpleMessage("Pages"),
    "detailsBookPublished" : MessageLookupByLibrary.simpleMessage("Published"),
    "detailsBookPublisher" : MessageLookupByLibrary.simpleMessage("Publisher"),
    "detailsBookSynopsis" : MessageLookupByLibrary.simpleMessage("Synopsis"),
    "detailsBookTitle" : MessageLookupByLibrary.simpleMessage("Title"),
    "detailsDescription" : MessageLookupByLibrary.simpleMessage("Description"),
    "detailsErrorAppBar" : MessageLookupByLibrary.simpleMessage("Error"),
    "detailsFailedToLoadBox" : MessageLookupByLibrary.simpleMessage("Failed to load box"),
    "detailsLoading" : MessageLookupByLibrary.simpleMessage("Loading"),
    "detailsLocation" : MessageLookupByLibrary.simpleMessage("Location"),
    "detailsLocationLoading" : MessageLookupByLibrary.simpleMessage("Loading location name..."),
    "detailsNoLocation" : MessageLookupByLibrary.simpleMessage("No location data"),
    "detailsPublishedOn" : MessageLookupByLibrary.simpleMessage("Published On"),
    "detailsStatus" : MessageLookupByLibrary.simpleMessage("Status"),
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
    "newBoxAddBookHelpText" : MessageLookupByLibrary.simpleMessage("Add books by clicking the button below"),
    "newBoxBookAuthor" : MessageLookupByLibrary.simpleMessage("Author"),
    "newBoxBookNotFound" : MessageLookupByLibrary.simpleMessage("Book not found"),
    "newBoxBookPublished" : MessageLookupByLibrary.simpleMessage("Published"),
    "newBoxBooksTitle" : MessageLookupByLibrary.simpleMessage("Books"),
    "newBoxCancelDialog" : MessageLookupByLibrary.simpleMessage("CANCEL"),
    "newBoxCloseTip" : MessageLookupByLibrary.simpleMessage("Close"),
    "newBoxDescriptionHintText" : MessageLookupByLibrary.simpleMessage("Looking to trade all my Harry Potter books. Only the last book in the series is missing."),
    "newBoxDescriptionTitle" : MessageLookupByLibrary.simpleMessage("Description"),
    "newBoxFieldPlaceholder" : MessageLookupByLibrary.simpleMessage("Unknown"),
    "newBoxFindBook" : MessageLookupByLibrary.simpleMessage("FIND BOOK"),
    "newBoxHideIsbnInfoText" : MessageLookupByLibrary.simpleMessage("Hide ISBN info"),
    "newBoxInfo" : MessageLookupByLibrary.simpleMessage("Creating a box is easy. First, add the books you want to trade. Second, write a catchy title and a short description. Finally, publish!"),
    "newBoxInvalidTitle" : MessageLookupByLibrary.simpleMessage("Title must be at least 4 characters long"),
    "newBoxIsPublishing" : MessageLookupByLibrary.simpleMessage("Publishing.."),
    "newBoxIsbnDialogTitle" : MessageLookupByLibrary.simpleMessage("Find book by ISBN"),
    "newBoxIsbnFieldHelpText" : MessageLookupByLibrary.simpleMessage("Enter ISBN"),
    "newBoxIsbnHintText" : MessageLookupByLibrary.simpleMessage("978-0-45-152634-2"),
    "newBoxIsbnInfoExampleIsbn" : MessageLookupByLibrary.simpleMessage("ISBN 978-0-45-152634-2"),
    "newBoxIsbnInfoExampleIsbnPlain" : MessageLookupByLibrary.simpleMessage("9780451526342"),
    "newBoxIsbnInfoText" : MessageLookupByLibrary.simpleMessage("ISBN is typically found on the back of a book."),
    "newBoxIsbnInvalid" : MessageLookupByLibrary.simpleMessage("Invalid ISBN"),
    "newBoxNoBooks" : MessageLookupByLibrary.simpleMessage("A box must have at least 1 book"),
    "newBoxPublishTip" : MessageLookupByLibrary.simpleMessage("Publish"),
    "newBoxRemoveBook" : MessageLookupByLibrary.simpleMessage("Delete"),
    "newBoxShowIsbnInfoText" : MessageLookupByLibrary.simpleMessage("Show ISBN info"),
    "newBoxTitle" : MessageLookupByLibrary.simpleMessage("Create a box"),
    "newBoxTitleHintText" : MessageLookupByLibrary.simpleMessage("All my Harry Potter books"),
    "newBoxTitleTitle" : MessageLookupByLibrary.simpleMessage("Title"),
    "profileBoxDetailsBtn" : MessageLookupByLibrary.simpleMessage("DETAILS"),
    "profileBoxesTabLabel" : MessageLookupByLibrary.simpleMessage("BOXES"),
    "profileChangeVisibilityBtn" : MessageLookupByLibrary.simpleMessage("CHANGE VISIBILITY"),
    "profileJoinDateTitle" : MessageLookupByLibrary.simpleMessage("Member since"),
    "profileLogout" : MessageLookupByLibrary.simpleMessage("Log out"),
    "profileMeTabLabel" : MessageLookupByLibrary.simpleMessage("ME"),
    "profileMyBoxesTabLabel" : MessageLookupByLibrary.simpleMessage("MY BOXES"),
    "profileNewBoxFAB" : MessageLookupByLibrary.simpleMessage("NEW BOX"),
    "profileNewBoxTitle" : MessageLookupByLibrary.simpleMessage("New box"),
    "profileOtherTabLabel" : MessageLookupByLibrary.simpleMessage("ABOUT"),
    "profilePreferencesTabLabel" : MessageLookupByLibrary.simpleMessage("PREFERENCES"),
    "profileRatingCardSubTitle" : MessageLookupByLibrary.simpleMessage("The rating is based on the feedback left by other users after a trade or interaction."),
    "profileRatingCardTitle" : MessageLookupByLibrary.simpleMessage("Rating"),
    "profileTradesTitle" : MessageLookupByLibrary.simpleMessage("Trades")
  };
}
