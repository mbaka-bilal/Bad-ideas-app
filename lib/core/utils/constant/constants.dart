class AppConstants {
  static const appName = 'Bad Ideas';
  static const baseUrl =
      "http://localhost:5000/api/v1"; //"https://harvoxx-school-server.vercel.app/api/v1";

// Errors
  static const kInvalidVerCodeFirebaseError = 'invalid-verification-code';
  static const kEmailAlreadyInUse = 'email-already-in-use';
  static const kUserNotFound = 'user-not-found';
  static const kWrongPassword = 'wrong-password';
  static const kUnknownError = "An unknown error has occurred";
  static const ktimedOut = "Request timed out";
  static const kUserNotVerified =
      "Your email has not been verified, please tap on the link sent to your email address to verify your account";

  //Share Preferences keys
  static String kHasSeenOnboarding = "${appName}hasSeenOnboarding";
  static String kUserId = "${appName}userId";
  static String kAccessToken = "${appName}accessToken";
  static String kRefreshToken = "${appName}refreshToken";

  static const timeoutDuration = Duration(minutes: 1);
}
