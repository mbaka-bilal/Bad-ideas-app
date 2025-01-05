import 'package:flutter/material.dart';

import '../../../core/utils/constant/colors.dart';
import '../../../core/utils/constant/constants.dart';
import '../../../core/utils/constant/spacing.dart';
import '../../../core/utils/text_style.dart';

class AppInputTextField extends StatefulWidget {
  const AppInputTextField({
    super.key,
    this.hideText = false,
    required this.controller,
    this.onChanged,
    this.focusNode,
    this.fillColor,
    this.enabled = true,
    this.borderColor,
    this.title,
    this.titleStyle,
    this.hintStyle,
    this.filled = false,
    this.keyboardType,
    this.textAlign = TextAlign.left,
    this.width,
    this.height,
    this.prefixWidth,
    this.prefixHeight,
    this.suffixWidth,
    this.suffixHeight,
    this.maxLines = 1,
    this.minLines,
    this.formFieldValidator,
    this.hintText,
    this.expands = false,
    this.suffixIcon,
    this.textStyle,
    this.contentPadding,
    this.border,
    this.textInputAction,
    this.prefixIcon,
    this.maxLength,
    this.autoValidate,
    this.onSubmitted,
    this.showCounter = false,
    this.maxTextFieldHeight,
  });

  final bool hideText;
  final int? maxLength;
  final double? width;
  final double? height;
  final TextAlign textAlign;
  final Color? borderColor;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final FormFieldValidator<String>? formFieldValidator;
  final Function(String)? onChanged;
  final String? hintText;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextStyle? titleStyle;
  final bool expands;
  final EdgeInsets? contentPadding;
  final bool filled;
  final double? prefixWidth;
  final double? prefixHeight;
  final double? suffixWidth;
  final double? suffixHeight;
  final int? maxLines;
  final int? minLines;
  final InputBorder? border;
  final String? title;
  final TextInputAction? textInputAction;
  final bool? autoValidate;
  final bool enabled;
  final bool showCounter;
  final Function(String)? onSubmitted;
  final double? maxTextFieldHeight;

  @override
  State<AppInputTextField> createState() => _AppInputTextFieldState();
}

class _AppInputTextFieldState extends State<AppInputTextField> {
  bool obscureText = false;

  void toggleVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        obscureText = widget.hideText;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              widget.title!,
              style: widget.titleStyle ??
                  AppTextStyle(context, size: 12, color: AppColors.white)
                      .fw400(),
            ),
          ),
          Spacing.smallVerticalSpace
        ],
        Container(
          width: widget.width,
          height: widget.height,
          constraints: BoxConstraints(
            maxWidth: AppConstants.kMaxWidth,
            maxHeight: widget.maxTextFieldHeight ?? double.infinity,
          ),
          child: TextFormField(
            autovalidateMode: widget.autoValidate == true
                ? AutovalidateMode.onUserInteraction
                : null,
            controller: widget.controller,
            textAlign: widget.textAlign,
            onChanged: (str) {
              if (widget.showCounter) {
                setState(() {});
              }
              if (widget.onChanged != null) widget.onChanged!(str);
            },
            onFieldSubmitted: widget.onSubmitted,
            focusNode: widget.focusNode,
            enabled: widget.enabled,
            // textInputAction: TextInputAction.next,
            validator: widget.formFieldValidator,
            expands: widget.expands,
            textAlignVertical: TextAlignVertical.top,
            minLines: widget.minLines,
            textInputAction: widget.textInputAction,
            maxLines: (widget.expands) ? null : widget.maxLines,
            maxLength: widget.maxLength,
            keyboardType: widget.keyboardType,
            style: widget.textStyle ??
                TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.white),
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding: widget.contentPadding ?? const EdgeInsets.all(12),
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              filled: true,
              fillColor: widget.fillColor,
              counter: (widget.showCounter)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.controller.text.length}/${widget.maxLength}",
                          style: AppTextStyle(context, size: 10).fw400(),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    )
                  : null,
              counterText: "",
              errorStyle:
                  AppTextStyle(context, color: Colors.redAccent).fw300(),
              border: widget.border,
              enabledBorder: widget.border,
              focusedBorder: widget.border,
              suffixIconConstraints:
                  (widget.suffixWidth != null && widget.suffixHeight != null)
                      ? BoxConstraints(
                          maxHeight: widget.suffixHeight!,
                          maxWidth: widget.suffixWidth!)
                      : null,
              prefixIconConstraints:
                  (widget.prefixWidth != null && widget.prefixHeight != null)
                      ? BoxConstraints(
                          maxHeight: widget.prefixHeight!,
                          maxWidth: widget.prefixWidth!)
                      : null,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon ??
                  ((widget.hideText)
                      ? IconButton(
                          onPressed: () => toggleVisibility(),
                          icon: (obscureText)
                              ? const Icon(Icons.visibility_off_outlined)
                              : const Icon(Icons.visibility_outlined))
                      : null),
            ),
          ),
        ),
      ],
    );
  }
}
