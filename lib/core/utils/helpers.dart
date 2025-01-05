import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'package:logger/logger.dart';

enum ToastType { error, success }

class AppHelpers {
  static void appToast(String message, {ToastType? type}) {
    Fluttertoast.cancel();

    Color backgroundColor;
    switch (type) {
      case ToastType.error:
        backgroundColor = Colors.red;
        break;
      case ToastType.success:
        backgroundColor = Colors.green;
        break;
      default:
        backgroundColor =
            Colors.black; // Default color if type is not specified correctly
    }

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void printToLog(
      {required String message, LogLevel level = LogLevel.error}) {
    final logger = Logger();
    if (level == LogLevel.debug) {
      logger.d(message);
    }
    if (level == LogLevel.error) {
      logger.e(message);
    }
  }

  static const double kMaxWebContentWidth = 1264;

  static const double kDefaultDesktopWebContentWidth = 500;

  static const double kWidthTrashHoldForMobileLayout = 550;

  static final kIsWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

  static final kUserMobileLayoutForWeb = !kIsWeb || kIsWebMobile;

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > kWidthTrashHoldForMobileLayout;
  }

  static double getDeviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getDeviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getTextFontSize(BuildContext context) {
    return MediaQuery.of(context).textScaler.scale(14);
  }

  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static EdgeInsets defaultPadding(
      {double left = 10.0,
      double right = 10.0,
      double bottom = 30.0,
      double top = 10.0}) {
    return EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);
  }

  static String formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'today';
    } else if (difference.inDays == 1) {
      return 'yesterday';
    } else {
      return DateFormat("dd',' MMM yy").format(date);
    }
  }

  static bool allFieldsFilled(List<TextEditingController> controllers) {
    for (var controller in controllers) {
      if (controller.text.trim() == "") {
        return false;
      }
    }
    return true;
  }
}

enum LogLevel {
  debug,
  error,
}
