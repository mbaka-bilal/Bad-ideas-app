import 'package:bad_ideas_app/controllers/services/navigation_service.dart';
import 'package:bad_ideas_app/views/widgets/wrap_child_with_layout_builder.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/constant/constants.dart';
import '../../../core/utils/constant/spacing.dart';
import '../../../core/utils/helpers.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/copyright.dart';
import '../../widgets/input_fields/app_input_fields.dart';
import 'forgot_password_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static const path = "/$routeName";
  static const routeName = "login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WrapChildWithLayoutBuilder(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(),
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
            title: "Username",
            controller: userNameController,
          ),
          Spacing.mediumVerticalSpace,
          AppInputTextField(
            title: "Password",
            controller: passwordController,
          ),
          Spacing.mediumVerticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    if (AppHelpers.isWeb) {
                      AppNavigator.push(
                          context: context,
                          name: ForgotPasswordScreen.routeName);
                    } else {
                      AppNavigator.go(
                          context: context,
                          name: ForgotPasswordScreen.routeName);
                    }
                  },
                  child: Text("Forgot password?")),
              TextButton(
                  onPressed: () {
                    if (AppHelpers.isWeb) {
                      AppNavigator.push(
                          context: context, name: SignupScreen.routeName);
                    } else {
                      AppNavigator.go(
                          context: context, name: SignupScreen.routeName);
                    }
                  },
                  child: Text("Signup"))
            ],
          )
        ],
      ),
    );
  }
}
