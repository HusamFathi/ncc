import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';

import '../../../../core/extensions/string.dart';
import '../../../../core/locale/app_localizations_helper.dart';

class MainShellPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainShellPage({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      theme: BottomBarThemeData(
        barDecoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
      ),
      body: Scaffold(body: navigationShell),
      child: LiquidGlassLens(
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: navigationShell.currentIndex,
          onTap: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
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
