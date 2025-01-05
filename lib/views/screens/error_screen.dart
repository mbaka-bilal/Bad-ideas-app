import 'package:bad_ideas_app/views/widgets/wrap_child_with_layout_builder.dart';
import 'package:flutter/material.dart';

import '../../controllers/services/navigation_service.dart';
import '../../core/utils/constant/constants.dart';
import '../../core/utils/constant/spacing.dart';
import '../../core/utils/extensions.dart';
import '../../core/utils/text_style.dart';
import '../widgets/buttons/app_buttons.dart';

class ErrorScreen extends StatelessWidget {
  static const path = "/$routeName";
  static const routeName = "not_found";

  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WrapChildWithLayoutBuilder(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: AppConstants.kMaxWidth),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "error_page".pngImage,
                    width: 400,
                    height: 400,
                  ),
                  Spacing.mediumVerticalSpace,
                  Text(
                    "Page not found",
                    style: AppTextStyle(context).fw600(),
                  ),
                  Spacing.xxlargeVerticalSpace,
                  AppButton(
                      buttonText: "Go to Home",
                      onPressed: () {
                        AppNavigator.go(context: context, path: "/");
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
