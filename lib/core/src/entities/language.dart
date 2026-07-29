import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

class Language extends Equatable {
  final String localCode;
  final Locale local;

  const Language({required this.localCode, required this.local});

  String getLanguageName({required BuildContext context}) {
    return LocaleNames.of(context) != null
        ? LocaleNames.of(context)!.nameOf(localCode) ?? 'Unknown'
        : 'Unknown';
  }

  String getLanguageNativeName({required BuildContext context}) {
    return LocaleNamesLocalizationsDelegate.nativeLocaleNames[localCode] ??
        'Unknown';
  }

  @override
  List<Object?> get props => [localCode, local];
}
