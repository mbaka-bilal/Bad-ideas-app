import 'package:flutter/material.dart';

import '../../../controllers/services/navigation_service.dart';
import '../../widgets/app_logo.dart';
import 'landing_screen.dart';

class SplashScreen extends StatefulWidget {
  static const path = "/";
  static const routeName = "splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AppNavigator.go(context: context, name: LandingScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppLogo(),
      ),
    );
  }
}
