import 'package:flutter/material.dart';

import '../constant/colors.dart';

final darkTheme = ThemeData(
    fontFamily: "roboto",
    scaffoldBackgroundColor: AppColors.primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonColor,
        foregroundColor: AppColors.white,
        elevation: 20,
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryColor),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        surfaceTintColor: AppColors.primaryColor));
