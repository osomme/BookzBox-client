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
      'Don\'t have an account? ',
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
      'Incorrect password',
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

  String get newBoxCloseTip {
    return Intl.message(
      'Close',
      name: 'newBoxCloseTip',
      desc: '',
      args: [],
    );
  }

  String get newBoxPublishTip {
    return Intl.message(
      'Publish',
      name: 'newBoxPublishTip',
      desc: '',
      args: [],
    );
  }

  String get newBoxFindBook {
    return Intl.message(
      'FIND BOOK',
      name: 'newBoxFindBook',
      desc: '',
      args: [],
    );
  }

  String get newBoxCancelDialog {
    return Intl.message(
      'CANCEL',
      name: 'newBoxCancelDialog',
      desc: '',
      args: [],
    );
  }

  String get newBoxIsbnDialogTitle {
    return Intl.message(
      'Find book by ISBN',
      name: 'newBoxIsbnDialogTitle',
      desc: '',
      args: [],
    );
  }

  String get newBoxIsbnInvalid {
    return Intl.message(
      'Invalid ISBN',
      name: 'newBoxIsbnInvalid',
      desc: '',
      args: [],
    );
  }

  String get newBoxIsbnInfoText {
    return Intl.message(
      'ISBN is typically found on the back of a book.',
      name: 'newBoxIsbnInfoText',
      desc: '',
      args: [],
    );
  }

  String get newBoxIsbnInfoExampleIsbn {
    return Intl.message(
      'ISBN 978-0-45-152634-2',
      name: 'newBoxIsbnInfoExampleIsbn',
      desc: '',
      args: [],
    );
  }

  String get newBoxIsbnInfoExampleIsbnPlain {
    return Intl.message(
      '9780451526342',
      name: 'newBoxIsbnInfoExampleIsbnPlain',
      desc: '',
      args: [],
    );
  }

  String get newBoxIsbnFieldHelpText {
    return Intl.message(
      'Enter ISBN',
      name: 'newBoxIsbnFieldHelpText',
      desc: '',
      args: [],
    );
  }

  String get newBoxTitle {
    return Intl.message(
      'Create a new box',
      name: 'newBoxTitle',
      desc: '',
      args: [],
    );
  }

  String get newBoxInfo {
    return Intl.message(
      'Creating a box is easy. First, add the books you want to trade. Second, write a catchy title and a short description. Finally, publish!',
      name: 'newBoxInfo',
      desc: '',
      args: [],
    );
  }

  String get newBoxBooksTitle {
    return Intl.message(
      'Books',
      name: 'newBoxBooksTitle',
      desc: '',
      args: [],
    );
  }

  String get newBoxTitleTitle {
    return Intl.message(
      'Title',
      name: 'newBoxTitleTitle',
      desc: '',
      args: [],
    );
  }

  String get newBoxDescriptionTitle {
    return Intl.message(
      'Description',
      name: 'newBoxDescriptionTitle',
      desc: '',
      args: [],
    );
  }

  String get newBoxBookAuthor {
    return Intl.message(
      'Author',
      name: 'newBoxBookAuthor',
      desc: '',
      args: [],
    );
  }

  String get newBoxBookPublished {
    return Intl.message(
      'Published',
      name: 'newBoxBookPublished',
      desc: '',
      args: [],
    );
  }

  String get newBoxAddBookButton {
    return Intl.message(
      'ADD BOOK',
      name: 'newBoxAddBookButton',
      desc: '',
      args: [],
    );
  }

  String get newBoxRemoveBook {
    return Intl.message(
      'Delete',
      name: 'newBoxRemoveBook',
      desc: '',
      args: [],
    );
  }

  String get newBoxInvalidTitle {
    return Intl.message(
      'Title must be at least 4 characters long',
      name: 'newBoxInvalidTitle',
      desc: '',
      args: [],
    );
  }

  String get newBoxNoBooks {
    return Intl.message(
      'A box must have at least 1 book',
      name: 'newBoxNoBooks',
      desc: '',
      args: [],
    );
  }

  String get newBoxFieldPlaceholder {
    return Intl.message(
      'Unknown',
      name: 'newBoxFieldPlaceholder',
      desc: '',
      args: [],
    );
  }

  String get newBoxIsPublishing {
    return Intl.message(
      'Publishing..',
      name: 'newBoxIsPublishing',
      desc: '',
      args: [],
    );
  }

  String get newBoxBookNotFound {
    return Intl.message(
      'Book not found',
      name: 'newBoxBookNotFound',
      desc: '',
      args: [],
    );
  }

  String get newBoxAddBookHelpText {
    return Intl.message(
      'Add books by clicking the button below',
      name: 'newBoxAddBookHelpText',
      desc: '',
      args: [],
    );
  }

  String get newBoxTitleHintText {
    return Intl.message(
      'All my Harry Potter books',
      name: 'newBoxTitleHintText',
      desc: '',
      args: [],
    );
  }

  String get newBoxDescriptionHintText {
    return Intl.message(
      'Looking to trade all my Harry Potter books. Only the last book in the series is missing.',
      name: 'newBoxDescriptionHintText',
      desc: '',
      args: [],
    );
  }

  String get newBoxIsbnHintText {
    return Intl.message(
      '978-0-45-152634-2',
      name: 'newBoxIsbnHintText',
      desc: '',
      args: [],
    );
  }

  String get newBoxShowIsbnInfoText {
    return Intl.message(
      'Show ISBN example',
      name: 'newBoxShowIsbnInfoText',
      desc: '',
      args: [],
    );
  }

  String get newBoxHideIsbnInfoText {
    return Intl.message(
      'Hide ISBN example',
      name: 'newBoxHideIsbnInfoText',
      desc: '',
      args: [],
    );
  }

  String get newBoxScanIsbnBtnText {
    return Intl.message(
      'Scan ISBN',
      name: 'newBoxScanIsbnBtnText',
      desc: '',
      args: [],
    );
  }

  String get newBoxCameraPermissionDenied {
    return Intl.message(
      'This feature requires camera permission.',
      name: 'newBoxCameraPermissionDenied',
      desc: '',
      args: [],
    );
  }

  String get newBoxUnknownScanError {
    return Intl.message(
      'Scan failed, please try again.',
      name: 'newBoxUnknownScanError',
      desc: '',
      args: [],
    );
  }

  String get homeNavBarFeedLabel {
    return Intl.message(
      'Feed',
      name: 'homeNavBarFeedLabel',
      desc: '',
      args: [],
    );
  }

  String get homeNavBarMapLabel {
    return Intl.message(
      'Map',
      name: 'homeNavBarMapLabel',
      desc: '',
      args: [],
    );
  }

  String get homeNavBarActivityLabel {
    return Intl.message(
      'Activity',
      name: 'homeNavBarActivityLabel',
      desc: '',
      args: [],
    );
  }

  String get homeNavBarProfileLabel {
    return Intl.message(
      'Profile',
      name: 'homeNavBarProfileLabel',
      desc: '',
      args: [],
    );
  }

  String get feedDescription {
    return Intl.message(
      'Description',
      name: 'feedDescription',
      desc: '',
      args: [],
    );
  }

  String get feedTitle {
    return Intl.message(
      'Top Boxes',
      name: 'feedTitle',
      desc: '',
      args: [],
    );
  }

  String get feedBooks {
    return Intl.message(
      'BOOKS',
      name: 'feedBooks',
      desc: '',
      args: [],
    );
  }

  String get feedLocation {
    return Intl.message(
      'LOCATION',
      name: 'feedLocation',
      desc: '',
      args: [],
    );
  }

  String get feedNoLocationData {
    return Intl.message(
      'No data',
      name: 'feedNoLocationData',
      desc: '',
      args: [],
    );
  }

  String get feedNoBoxesFound {
    return Intl.message(
      'No boxes found... Try changing your preferences!',
      name: 'feedNoBoxesFound',
      desc: '',
      args: [],
    );
  }

  String get profileLogout {
    return Intl.message(
      'Log out',
      name: 'profileLogout',
      desc: '',
      args: [],
    );
  }

  String get profileMeTabLabel {
    return Intl.message(
      'ME',
      name: 'profileMeTabLabel',
      desc: '',
      args: [],
    );
  }

  String get profileOtherTabLabel {
    return Intl.message(
      'ABOUT',
      name: 'profileOtherTabLabel',
      desc: '',
      args: [],
    );
  }

  String get profileMyBoxesTabLabel {
    return Intl.message(
      'MY BOXES',
      name: 'profileMyBoxesTabLabel',
      desc: '',
      args: [],
    );
  }

  String get profileBoxesTabLabel {
    return Intl.message(
      'BOXES',
      name: 'profileBoxesTabLabel',
      desc: '',
      args: [],
    );
  }

  String get profilePreferencesTabLabel {
    return Intl.message(
      'PREFERENCES',
      name: 'profilePreferencesTabLabel',
      desc: '',
      args: [],
    );
  }

  String get profileRatingCardTitle {
    return Intl.message(
      'Rating',
      name: 'profileRatingCardTitle',
      desc: '',
      args: [],
    );
  }

  String get profileRatingCardSubTitle {
    return Intl.message(
      'The rating is based on the feedback left by other users after a trade or interaction.',
      name: 'profileRatingCardSubTitle',
      desc: '',
      args: [],
    );
  }

  String get profileTradesTitle {
    return Intl.message(
      'Trades',
      name: 'profileTradesTitle',
      desc: '',
      args: [],
    );
  }

  String get profileJoinDateTitle {
    return Intl.message(
      'Member since',
      name: 'profileJoinDateTitle',
      desc: '',
      args: [],
    );
  }

  String get profileNewBoxTitle {
    return Intl.message(
      'New box',
      name: 'profileNewBoxTitle',
      desc: '',
      args: [],
    );
  }

  String get profileNewBoxFAB {
    return Intl.message(
      'NEW BOX',
      name: 'profileNewBoxFAB',
      desc: '',
      args: [],
    );
  }

  String get profileBoxDetailsBtn {
    return Intl.message(
      'DETAILS',
      name: 'profileBoxDetailsBtn',
      desc: '',
      args: [],
    );
  }

  String get profileChangeVisibilityBtn {
    return Intl.message(
      'CHANGE VISIBILITY',
      name: 'profileChangeVisibilityBtn',
      desc: '',
      args: [],
    );
  }

  String profileDisplayNameGreeting(dynamic displayName) {
    return Intl.message(
      'Hi, $displayName',
      name: 'profileDisplayNameGreeting',
      desc: '',
      args: [displayName],
    );
  }

  String get profileActivityStatusCardTitle {
    return Intl.message(
      'Activity status',
      name: 'profileActivityStatusCardTitle',
      desc: '',
      args: [],
    );
  }

  String get profileLastSeenText {
    return Intl.message(
      'Last seen:',
      name: 'profileLastSeenText',
      desc: '',
      args: [],
    );
  }

  String get profileLastSeenToday {
    return Intl.message(
      'Today',
      name: 'profileLastSeenToday',
      desc: '',
      args: [],
    );
  }

  String get profileLastSeenYesterday {
    return Intl.message(
      'Yesterday',
      name: 'profileLastSeenYesterday',
      desc: '',
      args: [],
    );
  }

  String profileLastSeenDaysAgo(dynamic amount) {
    return Intl.plural(
      amount,
      one: '1 day ago',
      other: '$amount days ago',
      name: 'profileLastSeenDaysAgo',
      desc: '',
      args: [amount],
    );
  }

  String get profileActivityStatusSubTitle {
    return Intl.message(
      'Status:',
      name: 'profileActivityStatusSubTitle',
      desc: '',
      args: [],
    );
  }

  String get profileActivityStatusActive {
    return Intl.message(
      'Active now',
      name: 'profileActivityStatusActive',
      desc: '',
      args: [],
    );
  }

  String get profileActivityStatusAway {
    return Intl.message(
      'Away',
      name: 'profileActivityStatusAway',
      desc: '',
      args: [],
    );
  }

  String get profileActivityStatusOffline {
    return Intl.message(
      'Offline',
      name: 'profileActivityStatusOffline',
      desc: '',
      args: [],
    );
  }

  String get profileNoBoxes {
    return Intl.message(
      'No boxes..',
      name: 'profileNoBoxes',
      desc: '',
      args: [],
    );
  }

  String get boxStatusPublicDesc {
    return Intl.message(
      'Everyone can see this box.',
      name: 'boxStatusPublicDesc',
      desc: '',
      args: [],
    );
  }

  String get boxStatusPrivateDesc {
    return Intl.message(
      'Only you can see this box.',
      name: 'boxStatusPrivateDesc',
      desc: '',
      args: [],
    );
  }

  String boxPublishedMinAgo(dynamic numMin) {
    return Intl.message(
      '$numMin min ago',
      name: 'boxPublishedMinAgo',
      desc: '',
      args: [numMin],
    );
  }

  String boxPublishedHoursAgo(dynamic amount) {
    return Intl.plural(
      amount,
      one: '1 hour ago',
      other: '$amount hours ago',
      name: 'boxPublishedHoursAgo',
      desc: '',
      args: [amount],
    );
  }

  String boxPublishedDaysAgo(dynamic amount) {
    return Intl.plural(
      amount,
      one: '1 day ago',
      other: '$amount days ago',
      name: 'boxPublishedDaysAgo',
      desc: '',
      args: [amount],
    );
  }

  String get boxCancelVisibilityChange {
    return Intl.message(
      'CANCEL',
      name: 'boxCancelVisibilityChange',
      desc: '',
      args: [],
    );
  }

  String get boxConfirmVisibilityChange {
    return Intl.message(
      'CONFIRM',
      name: 'boxConfirmVisibilityChange',
      desc: '',
      args: [],
    );
  }

  String get boxVisibilityChangeDialogTitle {
    return Intl.message(
      'Change box visibility',
      name: 'boxVisibilityChangeDialogTitle',
      desc: '',
      args: [],
    );
  }

  String get mapErrorNoLocationPermission {
    return Intl.message(
      'Location permissions must be enabled',
      name: 'mapErrorNoLocationPermission',
      desc: '',
      args: [],
    );
  }

  String get mapErrorBoxesError {
    return Intl.message(
      'Failed to retrieve boxes',
      name: 'mapErrorBoxesError',
      desc: '',
      args: [],
    );
  }

  String get mapNoImages {
    return Intl.message(
      'No Images',
      name: 'mapNoImages',
      desc: '',
      args: [],
    );
  }

  String get mapDescription {
    return Intl.message(
      'Description',
      name: 'mapDescription',
      desc: '',
      args: [],
    );
  }

  String get mapNoDescription {
    return Intl.message(
      'No description',
      name: 'mapNoDescription',
      desc: '',
      args: [],
    );
  }

  String get mapPublishedOn {
    return Intl.message(
      'Published',
      name: 'mapPublishedOn',
      desc: '',
      args: [],
    );
  }

  String get mapProfileLabel {
    return Intl.message(
      'Profile',
      name: 'mapProfileLabel',
      desc: '',
      args: [],
    );
  }

  String get mapDetailsLabel {
    return Intl.message(
      'Details',
      name: 'mapDetailsLabel',
      desc: '',
      args: [],
    );
  }

  String get feedNoDescription {
    return Intl.message(
      'No description',
      name: 'feedNoDescription',
      desc: '',
      args: [],
    );
  }

  String get authNewAccountNavigate {
    return Intl.message(
      'Create a new one',
      name: 'authNewAccountNavigate',
      desc: '',
      args: [],
    );
  }

  String get mapLikeLabel {
    return Intl.message(
      'Like',
      name: 'mapLikeLabel',
      desc: '',
      args: [],
    );
  }

  String get detailsLoading {
    return Intl.message(
      'Loading',
      name: 'detailsLoading',
      desc: '',
      args: [],
    );
  }

  String get detailsErrorAppBar {
    return Intl.message(
      'Error',
      name: 'detailsErrorAppBar',
      desc: '',
      args: [],
    );
  }

  String get detailsFailedToLoadBox {
    return Intl.message(
      'Failed to load box',
      name: 'detailsFailedToLoadBox',
      desc: '',
      args: [],
    );
  }

  String get detailsDescription {
    return Intl.message(
      'Description',
      name: 'detailsDescription',
      desc: '',
      args: [],
    );
  }

  String get detailsAboutSeller {
    return Intl.message(
      'About the seller',
      name: 'detailsAboutSeller',
      desc: '',
      args: [],
    );
  }

  String get detailsLocation {
    return Intl.message(
      'Location',
      name: 'detailsLocation',
      desc: '',
      args: [],
    );
  }

  String get detailsStatus {
    return Intl.message(
      'Status',
      name: 'detailsStatus',
      desc: '',
      args: [],
    );
  }

  String get detailsPublishedOn {
    return Intl.message(
      'Published On',
      name: 'detailsPublishedOn',
      desc: '',
      args: [],
    );
  }

  String get detailsBookTitle {
    return Intl.message(
      'Title',
      name: 'detailsBookTitle',
      desc: '',
      args: [],
    );
  }

  String get detailsBookSynopsis {
    return Intl.message(
      'Synopsis',
      name: 'detailsBookSynopsis',
      desc: '',
      args: [],
    );
  }

  String get detailsBookCondition {
    return Intl.message(
      'Condition',
      name: 'detailsBookCondition',
      desc: '',
      args: [],
    );
  }

  String get detailsBookPages {
    return Intl.message(
      'Pages',
      name: 'detailsBookPages',
      desc: '',
      args: [],
    );
  }

  String get detailsBookAuthor {
    return Intl.message(
      'Author',
      name: 'detailsBookAuthor',
      desc: '',
      args: [],
    );
  }

  String get detailsBookPublisher {
    return Intl.message(
      'Publisher',
      name: 'detailsBookPublisher',
      desc: '',
      args: [],
    );
  }

  String get detailsBookCategories {
    return Intl.message(
      'Categories',
      name: 'detailsBookCategories',
      desc: '',
      args: [],
    );
  }

  String get detailsBookPublished {
    return Intl.message(
      'Published',
      name: 'detailsBookPublished',
      desc: '',
      args: [],
    );
  }

  String get detailsBookNoSynopsis {
    return Intl.message(
      'No synopsis',
      name: 'detailsBookNoSynopsis',
      desc: '',
      args: [],
    );
  }

  String get boxStatusPublic {
    return Intl.message(
      'Public',
      name: 'boxStatusPublic',
      desc: '',
      args: [],
    );
  }

  String get boxStatusPrivate {
    return Intl.message(
      'Private',
      name: 'boxStatusPrivate',
      desc: '',
      args: [],
    );
  }

  String get boxStatusTraded {
    return Intl.message(
      'Traded',
      name: 'boxStatusTraded',
      desc: '',
      args: [],
    );
  }

  String get detailsLocationLoading {
    return Intl.message(
      'Loading location name...',
      name: 'detailsLocationLoading',
      desc: '',
      args: [],
    );
  }

  String get detailsNoLocation {
    return Intl.message(
      'No location data',
      name: 'detailsNoLocation',
      desc: '',
      args: [],
    );
  }

  String get activityItemMessagePost {
    return Intl.message(
      ' wrote: ',
      name: 'activityItemMessagePost',
      desc: '',
      args: [],
    );
  }

  String get activityItemLikeMiddle {
    return Intl.message(
      ' liked your box: ',
      name: 'activityItemLikeMiddle',
      desc: '',
      args: [],
    );
  }

  String get activityItemMatchPost {
    return Intl.message(
      ' has matched with you',
      name: 'activityItemMatchPost',
      desc: '',
      args: [],
    );
  }

  String get activityItemUnknown {
    return Intl.message(
      'Unknown activity',
      name: 'activityItemUnknown',
      desc: '',
      args: [],
    );
  }

  String get activityNewItem {
    return Intl.message(
      'New',
      name: 'activityNewItem',
      desc: '',
      args: [],
    );
  }

  String get activityScreenAppBarTitle {
    return Intl.message(
      'Recent activity',
      name: 'activityScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  String dateSecondsAgo(dynamic amount) {
    return Intl.plural(
      amount,
      one: '1 second ago',
      other: '$amount seconds ago',
      name: 'dateSecondsAgo',
      desc: '',
      args: [amount],
    );
  }

  String dateMinutesAgo(dynamic amount) {
    return Intl.plural(
      amount,
      one: '1 minute ago',
      other: '$amount minutes ago',
      name: 'dateMinutesAgo',
      desc: '',
      args: [amount],
    );
  }

  String dateDaysAgo(dynamic amount) {
    return Intl.plural(
      amount,
      one: '1 day ago',
      other: '$amount days ago',
      name: 'dateDaysAgo',
      desc: '',
      args: [amount],
    );
  }

  String dateHoursAgo(dynamic amount) {
    return Intl.plural(
      amount,
      one: '1 hour ago',
      other: '$amount hours ago',
      name: 'dateHoursAgo',
      desc: '',
      args: [amount],
    );
  }

  String get activityBoxFeedRemoveLike {
    return Intl.message(
      'REMOVE LIKE',
      name: 'activityBoxFeedRemoveLike',
      desc: '',
      args: [],
    );
  }

  String get activityTabLabelActivity {
    return Intl.message(
      'Activity',
      name: 'activityTabLabelActivity',
      desc: '',
      args: [],
    );
  }

  String get activityTabLabelMessages {
    return Intl.message(
      'Messages',
      name: 'activityTabLabelMessages',
      desc: '',
      args: [],
    );
  }

  String get activityTabLabelLikes {
    return Intl.message(
      'Likes',
      name: 'activityTabLabelLikes',
      desc: '',
      args: [],
    );
  }

  String get activityNoFeedItems {
    return Intl.message(
      'Your notification feed is empty',
      name: 'activityNoFeedItems',
      desc: '',
      args: [],
    );
  }

  String get activityFeedErrorMessage {
    return Intl.message(
      'Failed to load notifications',
      name: 'activityFeedErrorMessage',
      desc: '',
      args: [],
    );
  }

  String get activityFailedBoxLoad {
    return Intl.message(
      'Failed to load liked boxes',
      name: 'activityFailedBoxLoad',
      desc: '',
      args: [],
    );
  }

  String get activityNoLikedBoxes {
    return Intl.message(
      'You have not liked any boxes...',
      name: 'activityNoLikedBoxes',
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