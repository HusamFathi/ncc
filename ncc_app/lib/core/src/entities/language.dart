import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:language_code/language_code.dart';

class Language extends Equatable {
  final String localCode;
  final Locale local;

  const Language({required this.localCode, required this.local});

  /// Gets the English name of the language (e.g. "Filipino" for "fil")
  String getLanguageName() {
    try {
      final language = LanguageCodes.fromCode(localCode);
      return language.englishName;
    } catch (_) {
      return 'Unknown';
    }
  }

  String getLanguageNativeName() {
    try {
      final language = LanguageCodes.fromCode(localCode);
      return language.nativeName;
    } catch (_) {
      return 'Unknown';
    }
  }

  @override
  List<Object?> get props => [localCode, local];
  String getFlagEmoji() {
    final countryCode = local.countryCode;
    if (countryCode == null || countryCode.length != 2) return '🏳️';

    return countryCode
        .toUpperCase()
        .codeUnits
        .map((c) => String.fromCharCode(c + 127397))
        .join();
  }

  // get display name
}
