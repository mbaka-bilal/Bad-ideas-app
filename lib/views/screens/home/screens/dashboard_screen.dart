import 'package:flutter/material.dart';

import '../../../../core/utils/constant/colors.dart';
import '../../../../core/utils/constant/constants.dart';
import '../../../../core/utils/helpers.dart';
import '../../../../core/utils/text_style.dart';
import '../../../widgets/wrap_child_with_layout_builder.dart';

class DashboardScreen extends StatefulWidget {
  static const path = "/$routeName";
  static const routeName = "dashboard";

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WrapChildWithLayoutBuilder(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                //TODO change dare
              },
              onHorizontalDragEnd: (details) {
                if (!AppHelpers.isWeb) {
                  print("horizontal drag end");
                  //TODO change dare
                }
              },
              child: Container(
                padding: EdgeInsets.all(50),
                constraints: BoxConstraints(maxWidth: AppConstants.kMaxWidth),
                decoration: BoxDecoration(
                    color: AppColors.pink,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "I dare you " * 10,
                  style: AppTextStyle(context).fw500(),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
