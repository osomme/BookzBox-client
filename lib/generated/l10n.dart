// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S();
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S();
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

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

  String get newBoxPublishNoLocationError {
    return Intl.message(
      'Please check your location settings.',
      name: 'newBoxPublishNoLocationError',
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
      'No boxes found...',
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

  String profileDisplayNameGreeting(Object displayName) {
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

  String profileLastSeenDaysAgo(num amount) {
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

  String boxPublishedMinAgo(Object numMin) {
    return Intl.message(
      '$numMin min ago',
      name: 'boxPublishedMinAgo',
      desc: '',
      args: [numMin],
    );
  }

  String boxPublishedHoursAgo(num amount) {
    return Intl.plural(
      amount,
      one: '1 hour ago',
      other: '$amount hours ago',
      name: 'boxPublishedHoursAgo',
      desc: '',
      args: [amount],
    );
  }

  String boxPublishedDaysAgo(num amount) {
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
      'Box Description',
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
      'Unread',
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

  String dateSecondsAgo(num amount) {
    return Intl.plural(
      amount,
      one: '1 second ago',
      other: '$amount seconds ago',
      name: 'dateSecondsAgo',
      desc: '',
      args: [amount],
    );
  }

  String dateMinutesAgo(num amount) {
    return Intl.plural(
      amount,
      one: '1 minute ago',
      other: '$amount minutes ago',
      name: 'dateMinutesAgo',
      desc: '',
      args: [amount],
    );
  }

  String dateDaysAgo(num amount) {
    return Intl.plural(
      amount,
      one: '1 day ago',
      other: '$amount days ago',
      name: 'dateDaysAgo',
      desc: '',
      args: [amount],
    );
  }

  String dateHoursAgo(num amount) {
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
      'Your activity feed is empty',
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
      'You do not have any liked boxes',
      name: 'activityNoLikedBoxes',
      desc: '',
      args: [],
    );
  }

  String get activityStartChatting {
    return Intl.message(
      'Click to start chatting',
      name: 'activityStartChatting',
      desc: '',
      args: [],
    );
  }

  String get activityChatMedia {
    return Intl.message(
      '[Media]',
      name: 'activityChatMedia',
      desc: '',
      args: [],
    );
  }

  String get chatInputHint {
    return Intl.message(
      'Write a message...',
      name: 'chatInputHint',
      desc: '',
      args: [],
    );
  }

  String get activityNoChatItems {
    return Intl.message(
      'You have no active conversations',
      name: 'activityNoChatItems',
      desc: '',
      args: [],
    );
  }

  String get preferencesGenreHint {
    return Intl.message(
      'Add a genre',
      name: 'preferencesGenreHint',
      desc: '',
      args: [],
    );
  }

  String get preferencesGenreSearchHint {
    return Intl.message(
      'Find genre',
      name: 'preferencesGenreSearchHint',
      desc: '',
      args: [],
    );
  }

  String get preferencesRemoveGenreTip {
    return Intl.message(
      'Remove from favorites',
      name: 'preferencesRemoveGenreTip',
      desc: '',
      args: [],
    );
  }

  String get preferencesFavoriteGenreTitle {
    return Intl.message(
      'Favorite book genre',
      name: 'preferencesFavoriteGenreTitle',
      desc: '',
      args: [],
    );
  }

  String get preferencesFavoriteGenreInfo {
    return Intl.message(
      'Add your favorite genres. This will help us to recommend the most relevant boxes for you.',
      name: 'preferencesFavoriteGenreInfo',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectAction {
    return Intl.message(
      'Action',
      name: 'bookSubjectAction',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectAdventure {
    return Intl.message(
      'Adventure',
      name: 'bookSubjectAdventure',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectAnthology {
    return Intl.message(
      'Anthology',
      name: 'bookSubjectAnthology',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectChildren {
    return Intl.message(
      'Children\'s books',
      name: 'bookSubjectChildren',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectComic {
    return Intl.message(
      'Comic\'s',
      name: 'bookSubjectComic',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectComingOfAge {
    return Intl.message(
      'Coming of age',
      name: 'bookSubjectComingOfAge',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectCrime {
    return Intl.message(
      'Crime',
      name: 'bookSubjectCrime',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectDrama {
    return Intl.message(
      'Drama',
      name: 'bookSubjectDrama',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectFairytale {
    return Intl.message(
      'Fairytale',
      name: 'bookSubjectFairytale',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectGraphicNovel {
    return Intl.message(
      'Graphic novel',
      name: 'bookSubjectGraphicNovel',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectHistFict {
    return Intl.message(
      'Historical-fiction',
      name: 'bookSubjectHistFict',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectHorror {
    return Intl.message(
      'Horror',
      name: 'bookSubjectHorror',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectMystery {
    return Intl.message(
      'Mystery',
      name: 'bookSubjectMystery',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectParanormal {
    return Intl.message(
      'Paranormal',
      name: 'bookSubjectParanormal',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectPictureBook {
    return Intl.message(
      'Picture book',
      name: 'bookSubjectPictureBook',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectPoetry {
    return Intl.message(
      'Poetry',
      name: 'bookSubjectPoetry',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectPoliticalThriller {
    return Intl.message(
      'Political thriller',
      name: 'bookSubjectPoliticalThriller',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectRomance {
    return Intl.message(
      'Romance',
      name: 'bookSubjectRomance',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectSatire {
    return Intl.message(
      'Satire',
      name: 'bookSubjectSatire',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectSciFi {
    return Intl.message(
      'Science fiction (Sci-Fi)',
      name: 'bookSubjectSciFi',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectShortStory {
    return Intl.message(
      'Short story',
      name: 'bookSubjectShortStory',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectSuspense {
    return Intl.message(
      'Suspense',
      name: 'bookSubjectSuspense',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectThriller {
    return Intl.message(
      'Thriller',
      name: 'bookSubjectThriller',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectYoungAdult {
    return Intl.message(
      'Young-adult',
      name: 'bookSubjectYoungAdult',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectArt {
    return Intl.message(
      'Art',
      name: 'bookSubjectArt',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectAutobiography {
    return Intl.message(
      'Autobiography',
      name: 'bookSubjectAutobiography',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectBiography {
    return Intl.message(
      'Biography',
      name: 'bookSubjectBiography',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectCookbook {
    return Intl.message(
      'Cookbook',
      name: 'bookSubjectCookbook',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectDiary {
    return Intl.message(
      'Diary',
      name: 'bookSubjectDiary',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectDictionary {
    return Intl.message(
      'Dictionary',
      name: 'bookSubjectDictionary',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectEncyclopedia {
    return Intl.message(
      'Encyclopedia',
      name: 'bookSubjectEncyclopedia',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectEducational {
    return Intl.message(
      'Educational',
      name: 'bookSubjectEducational',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectWomen {
    return Intl.message(
      'Women',
      name: 'bookSubjectWomen',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectGuide {
    return Intl.message(
      'Guide',
      name: 'bookSubjectGuide',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectHealth {
    return Intl.message(
      'Health',
      name: 'bookSubjectHealth',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectHistory {
    return Intl.message(
      'History',
      name: 'bookSubjectHistory',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectJournal {
    return Intl.message(
      'Journal',
      name: 'bookSubjectJournal',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectMath {
    return Intl.message(
      'Math',
      name: 'bookSubjectMath',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectMemoir {
    return Intl.message(
      'Memoir',
      name: 'bookSubjectMemoir',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectPrayer {
    return Intl.message(
      'Prayer',
      name: 'bookSubjectPrayer',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectReligion {
    return Intl.message(
      'Religion',
      name: 'bookSubjectReligion',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectTextbook {
    return Intl.message(
      'Textbook',
      name: 'bookSubjectTextbook',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectScience {
    return Intl.message(
      'Science',
      name: 'bookSubjectScience',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectSelfhelp {
    return Intl.message(
      'Self help',
      name: 'bookSubjectSelfhelp',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectTravel {
    return Intl.message(
      'Travel',
      name: 'bookSubjectTravel',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectTrueCrime {
    return Intl.message(
      'True crime',
      name: 'bookSubjectTrueCrime',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectClassic {
    return Intl.message(
      'Classic',
      name: 'bookSubjectClassic',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectHumor {
    return Intl.message(
      'Humor',
      name: 'bookSubjectHumor',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectMythology {
    return Intl.message(
      'Mythology',
      name: 'bookSubjectMythology',
      desc: '',
      args: [],
    );
  }

  String get bookSubjectFiction {
    return Intl.message(
      'Fiction',
      name: 'bookSubjectFiction',
      desc: '',
      args: [],
    );
  }

  String get chatImageLoadFailed {
    return Intl.message(
      'Failed to load image',
      name: 'chatImageLoadFailed',
      desc: '',
      args: [],
    );
  }

  String get chatContentNotRendered {
    return Intl.message(
      'Failed to render message content',
      name: 'chatContentNotRendered',
      desc: '',
      args: [],
    );
  }

  String get chatImageUploading {
    return Intl.message(
      'Uploading image',
      name: 'chatImageUploading',
      desc: '',
      args: [],
    );
  }

  String get mapFilterTitle {
    return Intl.message(
      'Filter',
      name: 'mapFilterTitle',
      desc: '',
      args: [],
    );
  }

  String get mapFilterReset {
    return Intl.message(
      'Reset',
      name: 'mapFilterReset',
      desc: '',
      args: [],
    );
  }

  String get mapFilterApply {
    return Intl.message(
      'Apply',
      name: 'mapFilterApply',
      desc: '',
      args: [],
    );
  }

  String get mapFilterTitleOrDescription {
    return Intl.message(
      'Box Title or Description',
      name: 'mapFilterTitleOrDescription',
      desc: '',
      args: [],
    );
  }

  String get mapFilterDateLimitHint {
    return Intl.message(
      'Boxes no older than:',
      name: 'mapFilterDateLimitHint',
      desc: '',
      args: [],
    );
  }

  String get mapFilterNoDateLimit {
    return Intl.message(
      'No Limit',
      name: 'mapFilterNoDateLimit',
      desc: '',
      args: [],
    );
  }

  String get mapFilterDate24Hours {
    return Intl.message(
      '24 Hours',
      name: 'mapFilterDate24Hours',
      desc: '',
      args: [],
    );
  }

  String get mapFilterDate7Days {
    return Intl.message(
      '7 Days',
      name: 'mapFilterDate7Days',
      desc: '',
      args: [],
    );
  }

  String get mapFilterDate1Month {
    return Intl.message(
      '1 Month',
      name: 'mapFilterDate1Month',
      desc: '',
      args: [],
    );
  }

  String get mapFilterButtonLabel {
    return Intl.message(
      'Filter',
      name: 'mapFilterButtonLabel',
      desc: '',
      args: [],
    );
  }

  String get mapFilterAuthorLabel {
    return Intl.message(
      'Author',
      name: 'mapFilterAuthorLabel',
      desc: '',
      args: [],
    );
  }

  String get mapFilterBookTitleLabel {
    return Intl.message(
      'Book Title',
      name: 'mapFilterBookTitleLabel',
      desc: '',
      args: [],
    );
  }

  String get myBoxDelete {
    return Intl.message(
      'Delete',
      name: 'myBoxDelete',
      desc: '',
      args: [],
    );
  }

  String get activityItemRejectedTrade {
    return Intl.message(
      'rejected your trade offer',
      name: 'activityItemRejectedTrade',
      desc: '',
      args: [],
    );
  }

  String get activityItemAcceptedTrade {
    return Intl.message(
      'accepted your trade offer',
      name: 'activityItemAcceptedTrade',
      desc: '',
      args: [],
    );
  }

  String get activityitemNewTradeOffer {
    return Intl.message(
      'has sent you a new trade offer',
      name: 'activityitemNewTradeOffer',
      desc: '',
      args: [],
    );
  }

  String get activityItemUnknownTradeType {
    return Intl.message(
      'Unknown trade offer data',
      name: 'activityItemUnknownTradeType',
      desc: '',
      args: [],
    );
  }

  String get chatTradeNavigation {
    return Intl.message(
      'Trade',
      name: 'chatTradeNavigation',
      desc: '',
      args: [],
    );
  }

  String get tradeTitle {
    return Intl.message(
      'Trade Offers',
      name: 'tradeTitle',
      desc: '',
      args: [],
    );
  }

  String get tradeNoOffersYet {
    return Intl.message(
      'No trade offers yet',
      name: 'tradeNoOffersYet',
      desc: '',
      args: [],
    );
  }

  String get tradeMakeNewOffer {
    return Intl.message(
      'Make new trade offer',
      name: 'tradeMakeNewOffer',
      desc: '',
      args: [],
    );
  }

  String get tradeYouOffered {
    return Intl.message(
      'You offered:',
      name: 'tradeYouOffered',
      desc: '',
      args: [],
    );
  }

  String get tradeOfferWasRejected {
    return Intl.message(
      'Offer was rejected.',
      name: 'tradeOfferWasRejected',
      desc: '',
      args: [],
    );
  }

  String get tradeMakeANewOffer {
    return Intl.message(
      'Make a new offer',
      name: 'tradeMakeANewOffer',
      desc: '',
      args: [],
    );
  }

  String get tradeYourOffer {
    return Intl.message(
      'Your offer:',
      name: 'tradeYourOffer',
      desc: '',
      args: [],
    );
  }

  String get tradeTradeComplete {
    return Intl.message(
      'Trade Complete',
      name: 'tradeTradeComplete',
      desc: '',
      args: [],
    );
  }

  String get tradeYouAcceptedOffer {
    return Intl.message(
      'You accepted the offer',
      name: 'tradeYouAcceptedOffer',
      desc: '',
      args: [],
    );
  }

  String get tradeRespondToOffer {
    return Intl.message(
      'Respond to offer:',
      name: 'tradeRespondToOffer',
      desc: '',
      args: [],
    );
  }

  String get tradeAcceptButton {
    return Intl.message(
      'Accept',
      name: 'tradeAcceptButton',
      desc: '',
      args: [],
    );
  }

  String get tradeRejectButton {
    return Intl.message(
      'Reject',
      name: 'tradeRejectButton',
      desc: '',
      args: [],
    );
  }

  String get tradeUnknownOfferStatus {
    return Intl.message(
      'Unknown trade offer status',
      name: 'tradeUnknownOfferStatus',
      desc: '',
      args: [],
    );
  }

  String get tradeOfferWasMade {
    return Intl.message(
      'Offer was made ',
      name: 'tradeOfferWasMade',
      desc: '',
      args: [],
    );
  }

  String get tradeYouMadeATradeOffer {
    return Intl.message(
      'You made a trade offer:',
      name: 'tradeYouMadeATradeOffer',
      desc: '',
      args: [],
    );
  }

  String get tradeMakeANewTradeOffer {
    return Intl.message(
      'Make a new trade offer',
      name: 'tradeMakeANewTradeOffer',
      desc: '',
      args: [],
    );
  }

  String get tradeWhatWouldYouLikeToDo {
    return Intl.message(
      'What would you like to do?',
      name: 'tradeWhatWouldYouLikeToDo',
      desc: '',
      args: [],
    );
  }

  String get tradeMakeOffer {
    return Intl.message(
      'Make offer',
      name: 'tradeMakeOffer',
      desc: '',
      args: [],
    );
  }

  String tradeYouHaveRejected(Object username) {
    return Intl.message(
      'You have rejected the offer, wait for $username to make another offer, or make one yourself.',
      name: 'tradeYouHaveRejected',
      desc: '',
      args: [username],
    );
  }

  String tradeUserHasSentOffer(Object username) {
    return Intl.message(
      '$username has sent you a trade offer for:',
      name: 'tradeUserHasSentOffer',
      desc: '',
      args: [username],
    );
  }

  String tradeYouRejectedOffer(Object username) {
    return Intl.message(
      'You rejected $username\'s trade offer of:',
      name: 'tradeYouRejectedOffer',
      desc: '',
      args: [username],
    );
  }

  String tradeWaitingForResponseFrom(Object username) {
    return Intl.message(
      'Waiting for response from $username...',
      name: 'tradeWaitingForResponseFrom',
      desc: '',
      args: [username],
    );
  }

  String tradeUserRejectedThisOffer(Object username) {
    return Intl.message(
      '$username rejected this trade offer',
      name: 'tradeUserRejectedThisOffer',
      desc: '',
      args: [username],
    );
  }

  String tradeUsernameIsOffering(Object username) {
    return Intl.message(
      '$username is offering:',
      name: 'tradeUsernameIsOffering',
      desc: '',
      args: [username],
    );
  }

  String tradeUsernameOffered(Object username) {
    return Intl.message(
      '$username offered:',
      name: 'tradeUsernameOffered',
      desc: '',
      args: [username],
    );
  }

  String tradeYouRejectedWaitinForUsername(Object username) {
    return Intl.message(
      'You rejected this offer. Waiting for $username to make a new offer.',
      name: 'tradeYouRejectedWaitinForUsername',
      desc: '',
      args: [username],
    );
  }

  String tradeUsernamesOffer(Object username) {
    return Intl.message(
      '$username\'s offer:',
      name: 'tradeUsernamesOffer',
      desc: '',
      args: [username],
    );
  }

  String tradeWaitingForUsernameResponse(Object username) {
    return Intl.message(
      'Waiting for $username to respond to your offer',
      name: 'tradeWaitingForUsernameResponse',
      desc: '',
      args: [username],
    );
  }

  String tradeUsernameAcceptedOffer(Object username) {
    return Intl.message(
      '$username has accepted your offer',
      name: 'tradeUsernameAcceptedOffer',
      desc: '',
      args: [username],
    );
  }

  String get tradeOfferMade {
    return Intl.message(
      'Offer made ',
      name: 'tradeOfferMade',
      desc: '',
      args: [],
    );
  }

  String tradeTradeCompletePrompt(Object username) {
    return Intl.message(
      'You have both agreed to a trade. Start messaging $username to exchange addresses or arrange an in-person meetup to trade your boxes.',
      name: 'tradeTradeCompletePrompt',
      desc: '',
      args: [username],
    );
  }

  String get tradeAddressLabelLink {
    return Intl.message(
      'Get an address label from Posten.no',
      name: 'tradeAddressLabelLink',
      desc: '',
      args: [],
    );
  }

  String get tradeWebBrowserFailed {
    return Intl.message(
      'Failed to launch web browser',
      name: 'tradeWebBrowserFailed',
      desc: '',
      args: [],
    );
  }

  String get boxTradeListLoadFailed {
    return Intl.message(
      'Failed to load boxes',
      name: 'boxTradeListLoadFailed',
      desc: '',
      args: [],
    );
  }

  String get boxTradeListSelectTitle {
    return Intl.message(
      'Select a box',
      name: 'boxTradeListSelectTitle',
      desc: '',
      args: [],
    );
  }

  String get boxTradeListSelectDescription {
    return Intl.message(
      'Choose the box that you wish to trade',
      name: 'boxTradeListSelectDescription',
      desc: '',
      args: [],
    );
  }

  String get boxTradeListCancel {
    return Intl.message(
      'Cancel',
      name: 'boxTradeListCancel',
      desc: '',
      args: [],
    );
  }

  String get boxTradeListOk {
    return Intl.message(
      'Ok',
      name: 'boxTradeListOk',
      desc: '',
      args: [],
    );
  }

  String get bookConditionTitle {
    return Intl.message(
      'Book Condition',
      name: 'bookConditionTitle',
      desc: '',
      args: [],
    );
  }

  String get bookConditionUnknown {
    return Intl.message(
      'Unknown',
      name: 'bookConditionUnknown',
      desc: '',
      args: [],
    );
  }

  String get bookConditionNew {
    return Intl.message(
      'New',
      name: 'bookConditionNew',
      desc: '',
      args: [],
    );
  }

  String get bookConditionNewDesc {
    return Intl.message(
      'The book is brand-new and has not been used.',
      name: 'bookConditionNewDesc',
      desc: '',
      args: [],
    );
  }

  String get bookConditionLikeNew {
    return Intl.message(
      'Like new',
      name: 'bookConditionLikeNew',
      desc: '',
      args: [],
    );
  }

  String get bookConditionLikeNewDesc {
    return Intl.message(
      'The book has been used, but is in perfect working condition.',
      name: 'bookConditionLikeNewDesc',
      desc: '',
      args: [],
    );
  }

  String get bookConditionGood {
    return Intl.message(
      'Good',
      name: 'bookConditionGood',
      desc: '',
      args: [],
    );
  }

  String get bookConditionGoodDesc {
    return Intl.message(
      'The book may show some cosmetic damage such as scratches, but remains in good condition.',
      name: 'bookConditionGoodDesc',
      desc: '',
      args: [],
    );
  }

  String get bookConditionAcceptable {
    return Intl.message(
      'Acceptable',
      name: 'bookConditionAcceptable',
      desc: '',
      args: [],
    );
  }

  String get bookConditionAcceptableDesc {
    return Intl.message(
      'The book is fairly worn, but is still complete and can be read without issues.',
      name: 'bookConditionAcceptableDesc',
      desc: '',
      args: [],
    );
  }

  String get bookConditionDamaged {
    return Intl.message(
      'Damaged',
      name: 'bookConditionDamaged',
      desc: '',
      args: [],
    );
  }

  String get bookConditionDamagedDesc {
    return Intl.message(
      'The book is damaged. Missing or partial pages may occur.',
      name: 'bookConditionDamagedDesc',
      desc: '',
      args: [],
    );
  }

  String get bookConditionRequiredError {
    return Intl.message(
      'Please set the book condition.',
      name: 'bookConditionRequiredError',
      desc: '',
      args: [],
    );
  }

  String get activityClearAllUnread {
    return Intl.message(
      'Mark all as read',
      name: 'activityClearAllUnread',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'no'),
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
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}