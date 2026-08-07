import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio_background/just_audio_background.dart';

import '../../l10n/app_localizations.dart';
import '../../src/radio/presentation/blocs/radio_stream/radio_stream_bloc.dart';
import '../../src/settings/domain/entities/device_settings.dart';
import '../../src/settings/presentation/blocs/device_settings/device_settings_bloc.dart';
import '../extensions/string.dart';
import '../injection/init_di.dart';
import '../locale/app_language.dart';
import '../locale/app_localizations_helper.dart';
import '../route/routes_config.dart';
import '../src/widgets/loading_widget.dart';
import '../theme/app_theme.dart';

// ---- MOVE THESE OUTSIDE THE CLASS ----
bool _audioBgInit = false;
Future<void>? _audioBgInitFuture;
// --------------------------------------

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    // Splash will be removed only after radio is ready
  }

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: sl<RoutesService>().getInitRoute(),
      navigatorKey: RoutesService.navigatorKey,
      routes: sl<RoutesService>().routes,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<DeviceSettingsBloc>()..add(DeviceSettingsStarted()),
        ),
        BlocProvider(
          create: (context) => sl<RadioStreamBloc>()..add(RadioStreamStarted()),
        ),
      ],
      child: BlocBuilder<DeviceSettingsBloc, DeviceSettingsState>(
        builder: (context, state) {
          if (state is DeviceSettingsLoadedState) {
            final DeviceSettings setting = state.deviceSettings;

            // Build localized MaterialApp first!
            return MaterialApp.router(
              onGenerateTitle: (context) => Tr.of(context).appName.toTitle(),

              debugShowCheckedModeBanner: false,
              theme: sl<AppTheme>()
                  .getThemeByCode(code: 2, context: context)
                  .theme,
              locale: sl<AppLanguage>()
                  .getCurrentLanguage(code: setting.language)
                  .local,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: router,
              builder: (context, child) {
                // Only init audio background once, after localization ready!
                return FutureBuilder<void>(
                  future: _getOrInitAudioBg(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      FlutterNativeSplash.remove();
                      return child!;
                    }
                    return const Scaffold(body: LoadingWidget());
                  },
                );
              },
            );
          } else {
            return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: const Scaffold(body: LoadingWidget()),
            );
          }
        },
      ),
    );
  }
}

/// Ensures JustAudioBackground.init is only called once and after localization is ready
Future<void> _getOrInitAudioBg(BuildContext context) {
  log('Initializing audio background...');
  if (_audioBgInit) return _audioBgInitFuture ?? Future.value();
  _audioBgInit = true;
  _audioBgInitFuture = JustAudioBackground.init(
    androidNotificationChannelId: 'ncc_radios_channel',
    androidNotificationChannelName: Tr.of(context).channelRadioName.toTitle(),
    androidNotificationChannelDescription: Tr.of(
      context,
    ).channelRadioDescription.capitalizeFirstLetter(),
    androidNotificationOngoing: true,
  );
  return _audioBgInitFuture!;
}
