import 'package:go_router/go_router.dart';

import '../screens/auth/forgot_password_screen.dart';
import '../screens/auth/otp_screen.dart';

final authRoute = [
  GoRoute(
      path: ForgotPassword.path,
      name: ForgotPassword.routeName,
      builder: (context, state) => const ForgotPassword()),
  GoRoute(
      path: OtpScreen.path,
      name: OtpScreen.routeName,
      builder: (context, state) {
        final queryParams = state.uri.queryParameters;

        if (queryParams.isEmpty ||
            queryParams["email"] == "" ||
            queryParams["to"] == "") {
          throw "Invalid url";
        }

        return OtpScreen(
          email: state.uri.queryParameters['email']!,
          nextScreen: state.uri.queryParameters['to']!,
        );
      }),
];
