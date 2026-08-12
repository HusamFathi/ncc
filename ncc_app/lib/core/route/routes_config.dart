import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../src/onboarding/data/datasources/local/intro_data_local_data_source.dart';
import '../injection/init_di.dart';
import '../services/local_storage_service.dart';
import '../src/entities/go_route_url_data.dart';
import 'routes_list.dart';

class RoutesService {
  bool isNavigateWithGoContext = false;
  List<GoRouteUrlData> routesHistory = <GoRouteUrlData>[];
  ////! route state key
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'navigatorKey',
  );
  static GlobalKey<NavigatorState> homeShellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'homeShellNavigatorKey');
  static GlobalKey<NavigatorState> mainShellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'mainShellNavigatorKey');
  static GlobalKey<NavigatorState> settingsNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'settingsNavigatorKey');

  //* landing page
  static const String homeRoute = '/';
  static const String oboardingRoute = '/oboarding';
  static const String mainRoute = '/app';
  static const String settingsRoute = '/settings';
  static const String shareAppRoute = '/share-app';
  bool _isOnboardingSeen = false;

  /// route for control
  List<RouteBase> routes = [];
  String getInitRoute() {
    if (_isOnboardingSeen) {
      return mainRoute;
    } else {
      return oboardingRoute;
    }
  }

  Future<void> init() async {
    routes = RoutesList.getRoutes();
    _isOnboardingSeen =
        await sl<LocalStorageService>().getBool(
          IntroDataLocalDataSourceImpl.onboardingIsSeenKey,
        ) ??
        false;
  }

  void goBack({required BuildContext context}) {
    if (routesHistory.isEmpty) {
      return;
    }
    routesHistory.removeLast();
    if (routesHistory.isNotEmpty) {
      GoRouteUrlData lastRoute = routesHistory.last;
      log('goBack ${lastRoute.url}');
      isNavigateWithGoContext = true;

      // Uncomment if needed to navigate back to the last route
      context.go(lastRoute.url, extra: lastRoute.extra);
    } else {
      log('No more routes in history after removing the last one.');
    }

    // context.go(
    //   lastRoute.url,
    //   extra: lastRoute.extra,
    // );
  }

  bool hasHistory() {
    return routesHistory.isNotEmpty;
  }

  void goTo({
    required BuildContext context,
    required String path,
    Map<String, dynamic>? pathParameters,
    Map<String, dynamic>? queryParameters,
    Object? extra,
  }) {
    isNavigateWithGoContext = true;
    log('queryParameters $queryParameters');
    String finalUrl = Uri(
      path: generateUrl(path: path, pathParameters: pathParameters),
      queryParameters: queryParameters,
    ).toString();
    log('goTo $finalUrl');

    context.push(finalUrl, extra: extra);
  }

  void addNewRoute(RouteBase route) {
    routes.add(route);
  }

  String getCurrentRoutePath({required BuildContext context}) {
    String currentRoute = GoRouter.of(
      context,
    ).routeInformationProvider.value.uri.path;
    return currentRoute;
  }

  static void navigateToWithoutContext({required String routeName}) {
    if (RoutesService.navigatorKey.currentContext != null) {
      GoRouter.of(
        RoutesService.navigatorKey.currentContext!,
      ).goNamed(routeName);
    }
  }

  // String? publicRoutesRedirect(BuildContext context, GoRouterState state) {
  //   UserCredentialModel? user = CredentialsService.instance.userCredentials;
  //   if (user != null) {
  //     return workspacesRoute;
  //   }
  //   return null;
  // }

  // bool _isLoggedIn() => CredentialsService.instance.userCredentials != null;

  // String authRoutesRedirect(BuildContext context, GoRouterState state) {
  //   final String route = state.uri.toString();

  //   if (_isLoggedIn() != true) {
  //     return signInRoute;
  //   }
  //   routesHistory.add(
  //     GoRouteUrlData(
  //       url: route,
  //       extra: state.extra,
  //     ),
  //   );
  //   return route;
  // }

  void closeDialogs(BuildContext context, GoRouterState state) {
    final scaffoldState = Scaffold.maybeOf(context);
    if (scaffoldState == null || !scaffoldState.isDrawerOpen) {
      // Only close dialogs if the drawer is not open and Navigator can pop
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    }
  }

  // ///main shell onExist method
  // bool homeOnExist({
  //   required BuildContext context,
  //   required GoRouterState state,
  //   required String workspaceIdentifier,
  // }) {
  //   if (isNavigateWithGoContext) {
  //     isNavigateWithGoContext = false;
  //     return true;
  //   } else {
  //     final WorkspaceDestinationsBloc bloc =
  //         context.read<WorkspaceDestinationsBloc>();
  //     if (bloc.state is WorkspaceDestinationsLoaded) {
  //       bloc.add(
  //         WorkspaceDestinationsGoBack(
  //           context: context,
  //           workspace: workspaceIdentifier,
  //           sideMenuMode:
  //               (bloc.state as WorkspaceDestinationsLoaded).sideMenuMode,
  //         ),
  //       );
  //     }
  //     return true;
  //   }
  // }

  ///generate url for the route

  String generateUrl({
    required String path,
    Map<String, dynamic>? pathParameters,
  }) {
    if (pathParameters == null) return path;

    final missingFields = <String>[];
    final url = path.replaceAllMapped(RegExp(r':(\w+)'), (match) {
      final key = match.group(1)!;
      if (!pathParameters.containsKey(key)) {
        missingFields.add(key);
        return match.group(0)!; // returns the original placeholder
      }
      return pathParameters[key].toString();
    });

    if (missingFields.isNotEmpty) {
      throw Exception('Missing required fields: ${missingFields.join(', ')}');
    }
    return url;
  }

  // go to route without context
  void goToRouteWithoutContext({
    required String path,
    Map<String, dynamic>? pathParameters,
    Map<String, dynamic>? queryParameters,
    Object? extra,
  }) {
    if (navigatorKey.currentContext != null) {
      String finalUrl = Uri(
        path: sl<RoutesService>().generateUrl(
          path: path,
          pathParameters: pathParameters,
        ),
        queryParameters: queryParameters,
      ).toString();

      GoRouter.of(navigatorKey.currentContext!).go(finalUrl, extra: extra);
    }
  }
}
