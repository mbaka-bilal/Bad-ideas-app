import 'package:go_router/go_router.dart';

import '../views/screens/onboarding/landing_screen.dart';
import '../views/screens/onboarding/splash_screen.dart';

final List<GoRoute> onboardingRoutes = [
  GoRoute(
      path: SplashScreen.path,
      builder: (context, state) => const SplashScreen()),
  GoRoute(
      path: LandingScreen.path,
      builder: (context, state) => const LandingScreen()),
];
