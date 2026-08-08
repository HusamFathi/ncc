import 'package:go_router/go_router.dart';

import '../../src/main/presentation/pages/main_page.dart';
import '../../src/main/presentation/pages/main_shell_page.dart';
import '../../src/onboarding/presentation/pages/onboarding_page.dart';
import '../../src/settings/presentation/pages/settings_page.dart';
import 'routes_config.dart';

class RoutesList {
  static List<RouteBase> getRoutes() {
    return [
      // GoRoute(
      //   path: RoutesService.homeRoute,
      //   builder: (context, state) => const HomePage(),
      // ),
      GoRoute(
        path: RoutesService.oboardingRoute,
        builder: (context, state) =>
            OnboardingPage(query: state.pathParameters),
      ),

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
