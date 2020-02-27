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
      'Enter ISBN',
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

  String get newBoxTitle {
    return Intl.message(
      'Create a box',
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