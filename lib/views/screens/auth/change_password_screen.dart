import 'package:flutter/material.dart';

import '../../../core/utils/constant/constants.dart';
import '../../../core/utils/constant/spacing.dart';
import '../../widgets/app_appbar.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/copyright.dart';
import '../../widgets/input_fields/app_input_fields.dart';
import '../../widgets/wrap_child_with_layout_builder.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const path = "/$routeName";
  static const routeName = "change-password";

  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "Change Password"),
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
            title: "Username",
            controller: passwordController,
          ),
          Spacing.mediumVerticalSpace,
          AppInputTextField(
            title: "Confirm Password",
            controller: confirmPasswordController,
          ),
          Spacing.largeVerticalSpace,
          AppButton(
            buttonText: "Update",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
