import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../controllers/services/navigation_service.dart';
import '../../../core/utils/extensions.dart';
import '../../../core/utils/constant/spacing.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/wrap_child_with_layout_builder.dart';
import '../auth/login_screen.dart';
import '../auth/signup_screen.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = "landing";
  static const path = "/$routeName";

  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WrapChildWithLayoutBuilder(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "heart_filled".svgIcon,
              width: 100,
              height: 100,
            ),
            SizedBox(height: 100.h),
            AppButton(
              buttonText: "Login",
              onPressed: () {
                AppNavigator.go(context: context, name: LoginScreen.routeName);
              },
            ),
            Spacing.mediumVerticalSpace,
            AppButton(
              buttonText: "Signup",
              onPressed: () {
                AppNavigator.go(context: context, name: SignupScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
