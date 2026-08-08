import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/string.dart';
import '../../../../core/locale/app_localizations_helper.dart';
import '../../../radio/presentation/widgets/radio_stream_controller_widget.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            widget.navigationShell,
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: RadioStreamControllerWidget(),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
