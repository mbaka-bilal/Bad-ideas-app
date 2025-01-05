import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/utils/constant/colors.dart';
import '../../../core/utils/constant/constants.dart';
import '../../../core/utils/constant/spacing.dart';
import '../../../core/utils/text_style.dart';
import '../buttons/app_buttons.dart';

class LoadingStatusWrapper extends StatefulWidget {
  final bool isLoading;
  final bool isError;
  final String? errorMessage;
  final bool isEmpty;
  final Future<void> Function() retryFunction;
  final Widget child;
  final Widget loadingChild;

  const LoadingStatusWrapper(
      {super.key,
      required this.isLoading,
      required this.retryFunction,
      required this.isEmpty,
      required this.loadingChild,
      this.errorMessage,
      required this.isError,
      required this.child});

  @override
  State<LoadingStatusWrapper> createState() => _LoadingStatusWrapperState();
}

class _LoadingStatusWrapperState extends State<LoadingStatusWrapper> {
  @override
  Widget build(BuildContext context) {
    if (widget.isLoading && widget.isEmpty) {
      return widget.loadingChild;
    } else {
      return Stack(
        children: [
          (widget.isEmpty)
              ? Column(
                  children: [],
                )
              : widget.child,
          if (widget.isError)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: AppColors.primaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Failed",
                            style: AppTextStyle(context, color: AppColors.white)
                                .fw500(),
                          ),
                          Spacing.smallVerticalSpace,
                          Text(
                            widget.errorMessage ?? AppConstants.kUnknownError,
                            style: AppTextStyle(context, color: AppColors.white)
                                .fw300(),
                          ),
                        ],
                      ),
                    ),
                    AppButton(
                      buttonText: "Retry",
                      onPressed: () async => await widget.retryFunction(),
                    )
                  ],
                ),
              ),
            ),
          if (widget.isLoading)
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 40,
                height: 40,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      valueColor:
                          AlwaysStoppedAnimation(AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
            ),
        ],
      );
    }
  }
}
