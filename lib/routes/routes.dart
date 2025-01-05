import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../controllers/services/shared_preferences_manager.dart';
import '../core/utils/constant/constants.dart';
import '../views/screens/home/screens/dashboard_screen.dart';
import '../views/screens/error_screen.dart';
import '../views/screens/onboarding/splash_screen.dart';
import 'auth_route.dart';
import 'dashboard_route.dart';
import 'onboarding_routes.dart';
import 'profile_route.dart';

final globalNavKey = GlobalKey<NavigatorState>();

final publicRoutes = [
  GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
  ...onboardingRoutes,
  ...authRoute,
  GoRoute(
      path: '/${ErrorScreen.routeName}',
      builder: (context, state) => const ErrorScreen()),
];

final privateRoutes = [
  ...dashboardRoute,
  ...profileRoute,
];

final routes = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  navigatorKey: globalNavKey,
  restorationScopeId: 'router',
  onException: (context, state, router) {
    return router.go(ErrorScreen.path);
  },
  redirect: (context, state) async {
    // return null;

    final isLoggedIn = (await SharedPreferencesManager.getValue(
                AppConstants.kAccessToken) !=
            null &&
        await SharedPreferencesManager.getValue(AppConstants.kRefreshToken) !=
            null);

    if (isLoggedIn) {
      if (privateRoutes.map((e) => e.path).contains(state.matchedLocation)) {
        return null;
      } else {
        return DashboardScreen.path;
      }
    } else {
      if (publicRoutes.map((e) => e.path).contains(state.matchedLocation)) {
        return null;
      } else {
        return "/";
      }
    }
  },
  routes: [
    ...publicRoutes,
    ...privateRoutes,
  ],
);
