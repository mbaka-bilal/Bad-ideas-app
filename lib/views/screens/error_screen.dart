import 'package:flutter/material.dart';

import '../../core/utils/constant/spacing.dart';
import '../../core/utils/extensions.dart';
import '../../core/utils/text_style.dart';

class ErrorScreen extends StatelessWidget {
  static const path = "/$routeName";
  static const routeName = "not_found";

  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
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
            ],
          ),
        ),
      ),
    );
  }
}
