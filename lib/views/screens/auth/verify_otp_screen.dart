import 'package:bad_ideas_app/views/widgets/wrap_child_with_layout_builder.dart';
import 'package:flutter/material.dart';

import '../../../controllers/services/navigation_service.dart';
import '../../../core/utils/constant/constants.dart';
import '../../../core/utils/constant/spacing.dart';
import '../../../core/utils/helpers.dart';
import '../../widgets/app_appbar.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/copyright.dart';
import '../../widgets/input_fields/app_input_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  static const path = "/$routeName";
  static const routeName = "verify-otp";

  final String email;
  final String nextScreen;

  const VerifyOtpScreen(
      {super.key, required this.email, required this.nextScreen});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final List<TextEditingController> _controllers = List.generate(
    5,
    (index) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(
    5,
    (index) => FocusNode(),
  );

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "Verify OTP"),
      
      body: WrapChildWithLayoutBuilder(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppLogo(),
            Container(
              constraints: BoxConstraints(
                maxWidth: AppConstants.kMaxWidth,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Enter verification code sent to ${widget.email}'),
                  Spacing.xxlargeVerticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      5,
                      (index) => AppInputTextField(
                        width: 50,
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        border: OutlineInputBorder(),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 4) {
                            _focusNodes[index + 1].requestFocus();
                          }
                        },
                      ),
                    ),
                  ),
                  Spacing.xxlargeVerticalSpace,
                  AppButton(
                    buttonText: "Verify OTP",
                    onPressed: () => navToNextScreen(),
                  )
                ],
              ),
            ),
            Copyright()
          ],
        ),
      ),
    );
  }

  void navToNextScreen() {
    if (AppHelpers.isWeb) {
      AppNavigator.go(context: context, name: widget.nextScreen);
    } else {
      AppNavigator.push(context: context, name: widget.nextScreen);
    }
  }
}
