import 'package:flutter/material.dart';

import '../../../controllers/services/navigation_service.dart';
import '../../../core/utils/constant/constants.dart';
import '../../../core/utils/constant/spacing.dart';
import '../../../core/utils/helpers.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/copyright.dart';
import '../../widgets/input_fields/app_input_fields.dart';
import '../../widgets/wrap_child_with_layout_builder.dart';
import 'change_password_screen.dart';
import 'login_screen.dart';
import 'verify_otp_screen.dart';

class SignupScreen extends StatefulWidget {
  static const path = "/$routeName";
  static const routeName = "signup";

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WrapChildWithLayoutBuilder(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            AppLogo(),
          body(),
          Copyright(),
        ],
      )),
    );
  }

  Widget body() {
    return Container(
      constraints: BoxConstraints(maxWidth: AppConstants.kMaxWidth),
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppInputTextField(
            title: "Email",
            controller: emailController,
          ),
          Spacing.mediumVerticalSpace,
          AppInputTextField(
            title: "Username",
            controller: userNameController,
          ),
          Spacing.mediumVerticalSpace,
          AppInputTextField(
            title: "Password",
            controller: passwordController,
          ),
          Spacing.mediumVerticalSpace,
          AppInputTextField(
            title: "Confirm Password",
            controller: confirmPasswordController,
          ),
          Spacing.largeVerticalSpace,
          AppButton(
            buttonText: "Signup",
            onPressed: () {
              navToOtpScreen();
            },
          ),
          Spacing.mediumVerticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    if (AppHelpers.isWeb) {
                      AppNavigator.pushReplacement(
                          context: context, name: LoginScreen.routeName);
                    } else {
                      AppNavigator.pop(context: context);
                    }
                  },
                  child: Text("Already have an account? Login"))
            ],
          )
        ],
      ),
    );
  }

  void navToOtpScreen() {
    final queryParam = {
      "to": ChangePasswordScreen.routeName,
      "email": "emailController.text"
    };

    if (AppHelpers.isWeb) {
      AppNavigator.go(
          context: context,
          name: VerifyOtpScreen.routeName,
          queryParameters: queryParam);
    } else {
      AppNavigator.push(context: context, name: VerifyOtpScreen.routeName);
    }
  }
}
