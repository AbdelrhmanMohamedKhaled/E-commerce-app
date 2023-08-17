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

  /// `Welcome Back!`
  String get title {
    return Intl.message(
      'Welcome Back!',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `JOINUS NOW`
  String get title2 {
    return Intl.message(
      'JOINUS NOW',
      name: 'title2',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Name`
  String get Name {
    return Intl.message(
      'Enter Your Name',
      name: 'Name',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get Email {
    return Intl.message(
      'Enter Your Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your password`
  String get password {
    return Intl.message(
      'Enter Your password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `signup`
  String get signup {
    return Intl.message(
      'signup',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account`
  String get create {
    return Intl.message(
      'Already have an account',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Dont have an account`
  String get create2 {
    return Intl.message(
      'Dont have an account',
      name: 'create2',
      desc: '',
      args: [],
    );
  }

  /// `iPhone9`
  String get Product1 {
    return Intl.message(
      'iPhone9',
      name: 'Product1',
      desc: '',
      args: [],
    );
  }

  /// `An apple mobile which is nothing like apple`
  String get pdescription {
    return Intl.message(
      'An apple mobile which is nothing like apple',
      name: 'pdescription',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get New {
    return Intl.message(
      'New',
      name: 'New',
      desc: '',
      args: [],
    );
  }

  /// `ProductDetails`
  String get ProductDetails {
    return Intl.message(
      'ProductDetails',
      name: 'ProductDetails',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `My MyItems`
  String get MyItems {
    return Intl.message(
      'My MyItems',
      name: 'MyItems',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get About {
    return Intl.message(
      'About',
      name: 'About',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message(
      'Log out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Check Out`
  String get checkOut {
    return Intl.message(
      'Check Out',
      name: 'checkOut',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message(
      'Pay',
      name: 'pay',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
