import 'package:flutter/material.dart';

import '../../../controllers/services/navigation_service.dart';
import '../../../core/utils/constant/constants.dart';
import '../../../core/utils/constant/spacing.dart';
import '../../../core/utils/helpers.dart';
import '../../widgets/app_appbar.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/copyright.dart';
import '../../widgets/input_fields/app_input_fields.dart';
import '../../widgets/wrap_child_with_layout_builder.dart';
import 'change_password_screen.dart';
import 'verify_otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const path = "/$routeName";
  static const routeName = "forgot-password";

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "Forgot Password"),
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
          Spacing.largeVerticalSpace,
          AppButton(
            buttonText: "Reset Password",
            onPressed: () => navToOtpScreen(),
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
      AppNavigator.push(
          context: context,
          name: VerifyOtpScreen.routeName,
          queryParameters: queryParam);
    }
  }
}
