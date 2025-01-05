import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  BuildContext context;
  Color? color;
  double? size;
  TextDecoration? textDecoration;
  String? fontFamily;

  AppTextStyle(this.context,
      {this.color, this.size, this.textDecoration, this.fontFamily});

  TextStyle? fw300() {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
        color: color,
        fontWeight: FontWeight.w300,
        fontFamily: fontFamily,
        fontSize: (size != null) ? size!.sp : 10.sp,
        decoration: textDecoration);
  }

  TextStyle? fw400() {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: color,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: (size != null) ? size!.sp : 14.sp,
        decoration: textDecoration);
  }

  TextStyle? fw500() {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: color,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        fontSize: (size != null) ? size!.sp : 14.sp,
        decoration: textDecoration);
  }

  TextStyle? fw600() {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: color,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        fontSize: (size != null) ? size!.sp : 16.sp,
        decoration: textDecoration);
  }

  TextStyle? fw700() {
    return Theme.of(context).textTheme.headlineLarge?.copyWith(
        color: color,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        fontSize: (size != null) ? size!.sp : 20.sp,
        decoration: textDecoration);
  }

  TextStyle? fw800() {
    return Theme.of(context).textTheme.headlineLarge?.copyWith(
        color: color,
        fontWeight: FontWeight.w800,
        fontFamily: fontFamily,
        fontSize: (size != null) ? size!.sp : 20.sp,
        decoration: textDecoration);
  }
}
