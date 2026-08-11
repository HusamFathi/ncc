import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/string.dart';
import '../../../../core/locale/app_localizations_helper.dart';
import '../../../radio/presentation/blocs/radio_stream/radio_stream_bloc.dart';
import '../../../radio/presentation/widgets/radio_stream_controller_widget.dart';
import '../../../settings/presentation/blocs/device_settings/device_settings_bloc.dart';
import '../widgets/internet_status_widget.dart';
import '../widgets/system_volume_widget.dart';

class MainShellPage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const MainShellPage({super.key, required this.navigationShell});

  @override
  State<MainShellPage> createState() => _MainShellPageState();
}

class _MainShellPageState extends State<MainShellPage> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final settingsState = context.read<DeviceSettingsBloc>().state;
      if (settingsState is DeviceSettingsLoadedState) {
        context.read<RadioStreamBloc>().add(
          RadioStreamStarted(
            initVolume: settingsState.deviceSettings.radioVolume,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(child: widget.navigationShell),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: RadioStreamControllerWidget(),
            ),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          mainAxisSize: .min,
          children: [
            SystemVolumeWidget(),

            BottomNavigationBar(
              useLegacyColorScheme: false,

              elevation: 18,
              currentIndex: widget.navigationShell.currentIndex,
              onTap: (index) {
                widget.navigationShell.goBranch(
                  index,
                  initialLocation: index == widget.navigationShell.currentIndex,
                );
              },
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: Tr.of(context).home.toTitle(),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.menu),
                  label: Tr.of(context).menu.toTitle(),
                ),
              ],
            ),
            InternetStatusWidget()
          ],
        ),
      ),
    );
  }
}
