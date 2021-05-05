// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Kasikari-memo`
  String get title {
    return Intl.message(
      'Kasikari-memo',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Deadline:$time`
  String get deadline {
    return Intl.message(
      'Deadline:\$time',
      name: 'deadline',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get input_title {
    return Intl.message(
      'Registration',
      name: 'input_title',
      desc: '',
      args: [],
    );
  }

  /// `Who:$name`
  String get who {
    return Intl.message(
      'Who:\$name',
      name: 'who',
      desc: '',
      args: [],
    );
  }

  /// `BORROW`
  String get borrow {
    return Intl.message(
      'BORROW',
      name: 'borrow',
      desc: '',
      args: [],
    );
  }

  /// `LEND`
  String get lend {
    return Intl.message(
      'LEND',
      name: 'lend',
      desc: '',
      args: [],
    );
  }

  /// `Borrow`
  String get Registration_borrow {
    return Intl.message(
      'Borrow',
      name: 'Registration_borrow',
      desc: '',
      args: [],
    );
  }

  /// `Lend`
  String get Registration_lend {
    return Intl.message(
      'Lend',
      name: 'Registration_lend',
      desc: '',
      args: [],
    );
  }

  /// `FROM WHOM`
  String get Registration_name_borrow {
    return Intl.message(
      'FROM WHOM',
      name: 'Registration_name_borrow',
      desc: '',
      args: [],
    );
  }

  /// `TO WHOM`
  String get Registration_name_lend {
    return Intl.message(
      'TO WHOM',
      name: 'Registration_name_lend',
      desc: '',
      args: [],
    );
  }

  /// `Things I borrow`
  String get Registration_loan_borrow {
    return Intl.message(
      'Things I borrow',
      name: 'Registration_loan_borrow',
      desc: '',
      args: [],
    );
  }

  /// `Things I lend`
  String get Registration_loan_lend {
    return Intl.message(
      'Things I lend',
      name: 'Registration_loan_lend',
      desc: '',
      args: [],
    );
  }

  /// `Change Deadline`
  String get change_deadline {
    return Intl.message(
      'Change Deadline',
      name: 'change_deadline',
      desc: '',
      args: [],
    );
  }

  /// `Login/Register`
  String get login_register {
    return Intl.message(
      'Login/Register',
      name: 'login_register',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `User Info`
  String get dialog {
    return Intl.message(
      'User Info',
      name: 'dialog',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Login User : $mail`
  String get login_user {
    return Intl.message(
      'Login User : \$mail',
      name: 'login_user',
      desc: '',
      args: [],
    );
  }

  /// `Failed to login to Firebase`
  String get fail_login_firebase {
    return Intl.message(
      'Failed to login to Firebase',
      name: 'fail_login_firebase',
      desc: '',
      args: [],
    );
  }

  /// `Failed to register to Firebase`
  String get fail_register_firebase {
    return Intl.message(
      'Failed to register to Firebase',
      name: 'fail_register_firebase',
      desc: '',
      args: [],
    );
  }

  /// `Failed to connect to Firebase`
  String get fail_connect_firebase {
    return Intl.message(
      'Failed to connect to Firebase',
      name: 'fail_connect_firebase',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get validate_name {
    return Intl.message(
      'Please enter your name',
      name: 'validate_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your loan`
  String get validate_loan {
    return Intl.message(
      'Please enter your loan',
      name: 'validate_loan',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get validate_mail {
    return Intl.message(
      'Please enter your email',
      name: 'validate_mail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password`
  String get validate_password_null_empty {
    return Intl.message(
      'Please enter password',
      name: 'validate_password_null_empty',
      desc: '',
      args: [],
    );
  }

  /// `More than 6 characters`
  String get validate_password_short_length {
    return Intl.message(
      'More than 6 characters',
      name: 'validate_password_short_length',
      desc: '',
      args: [],
    );
  }

  /// `Let's tap the add button to take a note of your lending and borrowing!`
  String get list_null_data {
    return Intl.message(
      'Let`s tap the add button to take a note of your lending and borrowing!',
      name: 'list_null_data',
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
      Locale.fromSubtags(languageCode: 'ja'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
