import 'package:bad_ideas_app/core/utils/helpers.dart';
import 'package:bad_ideas_app/views/widgets/input_fields/app_input_fields.dart';
import 'package:flutter/material.dart';

import '../../../controllers/services/navigation_service.dart';
import '../../../core/utils/constant/constants.dart';
import '../../../core/utils/constant/spacing.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/profile_picture.dart';
import '../../widgets/wrap_child_with_layout_builder.dart';
import '../auth/update_password_screen.dart';

class MyProfileScreen extends StatefulWidget {
  static const path = "/$routeName";
  static const routeName = "my-profile";

  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WrapChildWithLayoutBuilder(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                constraints: BoxConstraints(maxWidth: AppConstants.kMaxWidth),
                child: body()),
          ],
        ),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        ProfilePicture(),
        Spacing.xxlargeVerticalSpace,
        AppInputTextField(
            title: "User Name", controller: userName, hintText: "User Name"),
        Spacing.mediumVerticalSpace,
        AppInputTextField(title: "Email", controller: email, hintText: "Email"),
        Spacing.xxlargeVerticalSpace,
        AppButton(
            buttonText: "Update Password",
            onPressed: () {
              if (AppHelpers.isWeb) {
                return AppNavigator.go(
                    context: context, name: UpdatePasswordScreen.routeName);
              } else {
                return AppNavigator.push(
                    context: context, name: UpdatePasswordScreen.routeName);
              }
            }),
        Spacing.mediumVerticalSpace,
        AppButton(buttonText: "Save", onPressed: () {})
      ],
    );
  }
}
