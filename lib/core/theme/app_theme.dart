import 'package:flutter/material.dart';

import '../extensions/string.dart';
import '../locale/app_localizations_helper.dart';
import '../src/entities/theme.dart';
import 'dark_theme.dart';
import 'light_theme.dart';

class AppTheme {
  static bool isDark =
      WidgetsBinding.instance.platformDispatcher.platformBrightness ==
      Brightness.dark;
  List<AppThemeData> getThemes(BuildContext context) {
    return [
      AppThemeData(
        code: 0,
        theme: isDark ? DarkTheme.data(context) : LightTheme.data(context),
      ),
      AppThemeData(code: 1, theme: LightTheme.data(context)),
      AppThemeData(code: 2, theme: DarkTheme.data(context)),
    ];
  }

  AppThemeData getThemeByCode({
    required int code,
    required BuildContext context,
  }) {
    final List<AppThemeData> themes = getThemes(context);
    return themes.firstWhere(
      (theme) => theme.code == code,
      orElse: () => AppThemeData(
        code: 0,
        theme: isDark ? DarkTheme.data(context) : LightTheme.data(context),
      ),
    );
  }

  String getThemeName({required int code, required BuildContext context}) {
    switch (code) {
      case 0:
        return Tr.of(context).syncWithSystem.capitalizeFirstLetter();
      case 1:
        return Tr.of(context).light.capitalizeFirstLetter();

      case 2:
        return Tr.of(context).dark.capitalizeFirstLetter();

      default:
        return Tr.of(context).syncWithSystem.capitalizeFirstLetter();
    }
  }
}
