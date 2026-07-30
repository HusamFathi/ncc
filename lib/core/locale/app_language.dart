import 'package:flutter/material.dart';

import '../src/entities/language.dart';
import 'app_localizations_helper.dart';

class AppLanguage {
  List<Language> getAppLocals({required BuildContext context}) {
    List<Locale> localesCodes = Tr.supportedLocales;
    List<Language> languages = [];
    for (var locale in localesCodes) {
      languages.add(Language(local: locale, localCode: locale.languageCode));
    }
    return languages;
  }

  Language getCurrentLanguage({String? code}) {
    if (code != null) {
      return Language(
        local: Locale.fromSubtags(languageCode: code),
        localCode: code,
      );
    } else {
      // return default language
      /// get device language
      final deviceLanguageCode =
          WidgetsBinding.instance.platformDispatcher.locale.languageCode;

      return Language(
        local: Locale.fromSubtags(languageCode: deviceLanguageCode),
        localCode: deviceLanguageCode,
      );
    }
  }
}
