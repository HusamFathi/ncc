import 'package:go_router/go_router.dart';
import '../../src/main/presentation/pages/main_page.dart';
import '../../src/main/presentation/pages/main_shell_page.dart';
import '../../src/settings/presentation/pages/settings_page.dart';

import '../../src/home/presentation/pages/home_page.dart';
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
      ShellRoute(
        navigatorKey: RoutesService.homeShellNavigatorKey,
        builder: (context, state, child) {
          return MainShellPage(child: child);
        },

        routes: [
          GoRoute(
            path: RoutesService.mainRoute,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const MainPage()),
          ),
          GoRoute(
            path: RoutesService.settingsRoute,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const SettingsPage()),
          ),
        ],
      ),
    ];
  }
}
