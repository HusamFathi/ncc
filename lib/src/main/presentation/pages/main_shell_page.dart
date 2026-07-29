import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:ncc/core/extensions/string.dart';
import 'package:ncc/core/locale/app_localizations_helper.dart';

import '../../../../core/di/init_di.dart';
import '../../../../core/route/routes_config.dart';
import '../../../../core/src/widgets/glass_card_widget.dart';

class MainShellPage extends StatelessWidget {
  final Widget child;
  const MainShellPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      body: Scaffold(body: child),
      child: GlassCardWidget(
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: getCurrentIndex(context),
          onTap: (index) {
            // Navigate to the corresponding route based on the index
            if (index == 0) {
              sl<RoutesService>().goTo(
                context: context,
                path: RoutesService.mainRoute,
              );
            } else if (index == 1) {
              sl<RoutesService>().goTo(
                context: context,
                path: RoutesService.settingsRoute,
              );
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: Tr.of(context).home.toTitle(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: Tr.of(context).menu.toTitle(),
            ),
          ],
        ),
      ),
    );
  }

  int getCurrentIndex(BuildContext context) {
    final String route = GoRouter.of(context).state.uri.toString();
    if (route == RoutesService.mainRoute) {
      return 0;
    } else if (route == RoutesService.settingsRoute) {
      return 1;
    }
    return 0;
  }
}
