import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/services/shared_preferences_manager.dart';
import '../core/utils/constant/constants.dart';
import 'auth_route.dart';

final globalNavKey = GlobalKey<NavigatorState>();

final routes = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  navigatorKey: globalNavKey,
  restorationScopeId: 'router',
  onException: (context, state, router) {
    //TODO return error page
  },
  redirect: (context, state) async {
    final isLoggedIn = (await SharedPreferencesManager.getValue(
                AppConstants.kAccessToken) !=
            null &&
        await SharedPreferencesManager.getValue(AppConstants.kRefreshToken) !=
            null);

    if (isLoggedIn) {
      if (privateRoutes.map((e) => e.path).contains(state.matchedLocation)) {
        return state.matchedLocation;
      } else {
        return null;
      }
    } else {
      return null;
    }
  },
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
    ...publicRoutes,
    ...privateRoutes,
  ],
);

final publicRoutes = [
  ...authRoute,
];

final privateRoutes = [
  GoRoute(
      path: DashboardScreen.path,
      name: DashboardScreen.routeName,
      builder: (context, state) => DashboardScreen()),
  ...profileRoute
];
