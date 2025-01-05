import 'package:go_router/go_router.dart';

import '../views/screens/auth/change_password_screen.dart';
import '../views/screens/auth/forgot_password_screen.dart';
import '../views/screens/auth/login_screen.dart';
import '../views/screens/auth/signup_screen.dart';
import '../views/screens/auth/update_password_screen.dart';
import '../views/screens/auth/verify_otp_screen.dart';

final authRoute = [
  GoRoute(
      path: LoginScreen.path,
      name: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen()),
  GoRoute(
      path: SignupScreen.path,
      name: SignupScreen.routeName,
      builder: (context, state) => const SignupScreen()),
  GoRoute(
      path: ForgotPasswordScreen.path,
      name: ForgotPasswordScreen.routeName,
      builder: (context, state) => const ForgotPasswordScreen()),
  GoRoute(
      path: VerifyOtpScreen.path,
      name: VerifyOtpScreen.routeName,
      builder: (context, state) {
        print("Uri =========== ${state.fullPath}");
        final queryParams = state.uri.queryParameters;

        if (queryParams.isEmpty ||
            queryParams["email"] == "" ||
            queryParams["to"] == "") {
          throw GoException("Invalid url");
        }

        return VerifyOtpScreen(
          email: state.uri.queryParameters['email']!,
          nextScreen: state.uri.queryParameters['to']!,
        );
      }),
  GoRoute(
      path: ChangePasswordScreen.path,
      name: ChangePasswordScreen.routeName,
      builder: (context, state) => const ChangePasswordScreen()),
  GoRoute(
      path: UpdatePasswordScreen.path,
      name: UpdatePasswordScreen.routeName,
      builder: (context, state) => const UpdatePasswordScreen()),
];
