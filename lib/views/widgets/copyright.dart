import 'package:bad_ideas_app/core/utils/constant/constants.dart';
import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  const Copyright({super.key});

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    return Text(
      "Copyright © $currentYear ${AppConstants.appName}. All rights reserved.",
    );
  }
}
