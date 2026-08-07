import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class Tr {
  static LocalizationsDelegate<AppLocalizations> get getDelegate =>
      AppLocalizations.delegate;
  static late AppLocalizations _instance;
  static bool _isInitialized = false;

  static List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  static AppLocalizations of(BuildContext context) {
    _instance = AppLocalizations.of(context);
    _isInitialized = true;
    return _instance;
  }

  static AppLocalizations get current {
    if (!_isInitialized) {
      throw Exception(
        'AppLocalizations has not been initialized. Call Tr.of(context) first.',
      );
    }
    return _instance;
  }

  static void initialize(BuildContext context) {
    _instance = AppLocalizations.of(context);
    _isInitialized = true;
  }
}
