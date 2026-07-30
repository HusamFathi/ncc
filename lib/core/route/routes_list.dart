import 'package:go_router/go_router.dart';
import 'package:ncc/src/main/presentation/pages/main_page.dart';

import '../../src/home/presentation/pages/home_page.dart';
import '../../src/main/presentation/pages/main_shell_page.dart';
import '../../src/settings/presentation/pages/settings_page.dart';
import 'routes_config.dart';

class RoutesList {
  static List<RouteBase> getRoutes() {
    return [
      GoRoute(
        path: RoutesService.homeRoute,
        builder: (context, state) => const HomePage(),
      ),
      // GoRoute(
      //   path: RoutesService.mainRoute,
      //   builder: (context, state) => const MainPage(),
      // ),
      // GoRoute(
      //   path: RoutesService.settingsRoute,
      //   builder: (context, state) => const SettingsPage(),
      // ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShellPage(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: RoutesService.homeShellNavigatorKey,
            routes: [
              GoRoute(
                path: RoutesService.mainRoute,
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: const MainPage()),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: RoutesService.settingsNavigatorKey,
            routes: [
              GoRoute(
                path: RoutesService.settingsRoute,
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: const SettingsPage()),
              ),
            ],
          ),
        ],
      ),
    ];
  }
}
