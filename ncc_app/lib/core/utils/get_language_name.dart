import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

String getLanguageName(String isoCode, BuildContext context) {
  var locale = Locale(isoCode.split('_').first, isoCode.split('_').last);
  return LocaleNames.of(context)!.nameOf(locale.languageCode) ??
      'Unknown Language';
}
