import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../src/settings/presentation/blocs/device_settings/device_settings_bloc.dart';

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

  Language getUserLanguageFromContext({required BuildContext context}) {
    // get setting bloc
    final DeviceSettingsBloc bloc = context.read<DeviceSettingsBloc>();
    String? code;
    if (bloc.state is DeviceSettingsLoadedState) {
      DeviceSettingsLoadedState deviceSettingsLoadedState =
          bloc.state as DeviceSettingsLoadedState;
      code = deviceSettingsLoadedState.deviceSettings.language;
    }
    return getCurrentLanguage(code: code);
  }
}
