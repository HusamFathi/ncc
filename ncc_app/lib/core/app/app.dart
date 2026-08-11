import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:no_screenshot/no_screenshot.dart';

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

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _noScreenshot = NoScreenshot.instance;

  @override
  void initState() {
    super.initState();
    _handleScreenEvent();
  }

  Future<void> _handleScreenEvent() async {
    await _noScreenshot.screenshotOff();
    // 1. Subscribe to the stream
    _noScreenshot.screenshotStream.listen((snapshot) {
      log('Protection active: ${snapshot.isScreenshotProtectionOn}');
      log('Screenshot taken: ${snapshot.wasScreenshotTaken}');
      log('Path: ${snapshot.screenshotPath}');
    });

    // 2. Start monitoring
    await _noScreenshot.startScreenshotListening();
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
        BlocProvider(create: (context) => sl<RadioStreamBloc>()),
      ],
      child: BlocConsumer<DeviceSettingsBloc, DeviceSettingsState>(
        listener: (context, state) {
          if (state is DeviceSettingsLoadedState) {
            context.read<RadioStreamBloc>().add(
              RadioStreamStarted(initVolume: state.deviceSettings.radioVolume),
            );
          }
        },
        builder: (context, state) {
          return BlocBuilder<DeviceSettingsBloc, DeviceSettingsState>(
            builder: (context, state) {
              if (state is DeviceSettingsLoadedState) {
                final DeviceSettings setting = state.deviceSettings;

                // Build localized MaterialApp first!
                return MaterialApp.router(
                  onGenerateTitle: (context) =>
                      Tr.of(context).appName.toTitle(),

                  debugShowCheckedModeBanner: false,
                  theme: sl<AppTheme>()
                      .getThemeByCode(code: 2, context: context)
                      .theme,
                  locale: sl<AppLanguage>()
                      .getCurrentLanguage(code: setting.language)
                      .local,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  routerConfig: router,
                  builder: (context, child) {
                    return child!;
                  },
                );
              } else {
                return MaterialApp(
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  home: const Scaffold(body: LoadingWidget()),
                );
              }
            },
          );
        },
      ),
    );
  }
}
