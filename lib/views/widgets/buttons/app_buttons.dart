import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/constant/colors.dart';
import '../../../core/utils/text_style.dart';
import '../dialogs/loading_indicator.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.onPressed,
      this.child,
      this.backgroundColor,
      this.buttonText,
      this.borderRadius,
      this.borderColor,
      this.textColor,
      this.width,
      this.height,
      this.padding,
      this.elevation,
      this.isLoading = false,
      this.textStyle});

  final Function()? onPressed;
  final Widget? child;
  final Color? backgroundColor;
  final String? buttonText;
  final double? borderRadius;
  final double? width;
  final double? height;
  final Color? textColor;
  final double? elevation;
  final Color? borderColor;
  final bool isLoading;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    assert(child != null || buttonText != null,
        "Either child or text is required");

    return Container(
      height: height ?? 70.h,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 16)),
      child: ElevatedButton(
        onPressed: (onPressed == null || isLoading) ? null : () => onPressed!(),
        style: ButtonStyle(
            elevation: WidgetStateProperty.all(elevation),
            padding: WidgetStateProperty.all(
                padding ?? const EdgeInsets.symmetric(horizontal: 25)),
            side: WidgetStateProperty.all(BorderSide(
              color: borderColor ?? Colors.transparent,
            )),
            backgroundColor: (backgroundColor == null)
                ? null
                : WidgetStateProperty.all(backgroundColor),
            shape: (borderRadius == null)
                ? null
                : WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadius!))))),
        child: isLoading
            ? LoadingIndicator()
            : Padding(
                padding: const EdgeInsets.all(4.0),
                child: (child ??
                    Text(
                      buttonText!,
                      overflow: TextOverflow.ellipsis,
                      style: textStyle ??
                          AppTextStyle(
                            context,
                            color: (onPressed == null)
                                ? AppColors.grey3
                                : (textColor ?? Colors.white),
                          ).fw400(),
                    )),
              ),
      ),
    );
  }
}
