import 'package:flutter/material.dart';

import '../constant/colors.dart';

final darkTheme = ThemeData(
    fontFamily: "roboto",
    scaffoldBackgroundColor: AppColors.white,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: AppColors.white),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white));
