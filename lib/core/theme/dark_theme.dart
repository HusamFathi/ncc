import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'components/card_theme_component.dart';
import 'components/custom_input_border.dart';

class DarkTheme {
  static ThemeData data(BuildContext context) {
    ThemeData theme = ThemeData(
      applyElevationOverlayColor: false,
      colorScheme: ColorScheme.fromSeed(
        seedColor: kNCCPrimaryColor,
        secondary: kNCCSecondaryColor,
        tertiary: kNCCThirdColor,
        brightness: Brightness.dark,
      ),
      fontFamily: 'Tajawal',

      cardTheme: CardThemeComponent.data,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      navigationRailTheme: const NavigationRailThemeData(
        // backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      ),
      useMaterial3: true,
      inputDecorationTheme: const InputDecorationTheme(
        border: CustomInputBorder(),
      ),
    );
    return theme;
  }
}
