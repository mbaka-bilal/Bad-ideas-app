import 'package:flutter/cupertino.dart';

import '../../../core/state/base.state.dart';
import '../../../core/utils/constant/colors.dart';
import '../../../core/utils/constant/spacing.dart';
import '../../../core/utils/extensions.dart';
import '../buttons/app_buttons.dart';

class StatusDialogWidget extends StatelessWidget {
  const StatusDialogWidget(
      {super.key,
      required this.status,
      this.showErrorState = true,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.mainAxisSize = MainAxisSize.max,
      this.showSuccessWidget = false,
      this.showLoadingForInitialState = false,
      this.loadingChild,
      this.message,
      this.padding,
      this.retryFunction,
      this.retryWidget});

  final Status status;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final String? message;
  final bool showLoadingForInitialState;
  final Widget? retryWidget;
  final bool showSuccessWidget;
  final Widget? loadingChild;
  final EdgeInsets? padding;
  final Function? retryFunction;
  final bool showErrorState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(),
          if (status == Status.loading ||
              (showLoadingForInitialState && status == Status.initial))
            (loadingChild != null)
                ? loadingChild!
                : const Center(
                    child: CupertinoActivityIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
          if (showErrorState &&
              (status == Status.error || status == Status.notVerified)) ...[
            Image.asset("error".pngImage),
            if (message != null) ...[
              Spacing.mediumVerticalSpace,
              Text(
                message!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (retryFunction != null) ...[
                Spacing.mediumVerticalSpace,
                AppButton(
                  onPressed: () => retryFunction!(),
                  buttonText: "Retry",
                )
              ]
            ]
          ],
          if (showErrorState && status == Status.noNetwork) ...[
            Image.asset(
              "no-signal".pngImage,
              width: 50,
              height: 50,
            ),
            if (message != null) ...[
              Spacing.mediumVerticalSpace,
              Text(
                message!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (retryFunction != null) ...[
                Spacing.mediumVerticalSpace,
                AppButton(
                  onPressed: () => retryFunction!(),
                  buttonText: "Retry",
                )
              ]
            ]
          ],
          if (showSuccessWidget && status == Status.success) ...[
            Image.asset("success".pngImage),
            if (message != null) ...[
              Spacing.mediumVerticalSpace,
              Text(
                message!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]
          ]
        ],
      ),
    );
  }
}
