import 'package:flutter/material.dart';

import '../../../core/utils/constant/constants.dart';
import '../../../core/utils/constant/spacing.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/copyright.dart';
import '../../widgets/input_fields/app_input_fields.dart';
import '../../widgets/wrap_child_with_layout_builder.dart';

class UpdatePasswordScreen extends StatefulWidget {
  static const path = "/$routeName";
  static const routeName = "update-password";

  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
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
            title: "Current Password",
            controller: currentPasswordController,
          ),
          Spacing.mediumVerticalSpace,
          AppInputTextField(
            title: "New Password",
            controller: newPasswordController,
          ),
          Spacing.mediumVerticalSpace,
          AppInputTextField(
            title: "Confirm New Password",
            controller: confirmNewPasswordController,
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
