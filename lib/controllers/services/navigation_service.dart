import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/helpers.dart';


class AppNavigator {
  static Future<dynamic> push(
      {required BuildContext context,
      Widget? screen,
      String? animationStyle,
      String? path,
      dynamic extra,
      Map<String, dynamic>? queryParameters,
      String? name}) async {
    assert(screen != null || name != null || path != null);

    AppHelpers.dismissKeyboard();

    if (name != null) {
      return await context.pushNamed(name,
          extra: extra, queryParameters: queryParameters ?? {});
    }

    if (path != null) {
      return await context.push(
        path,
        extra: extra,
      );
    }

    return await Navigator.push(
        context, MaterialPageRoute(builder: (context) => screen!));
  }

  static Future<dynamic> pushReplacement(
      {required BuildContext context,
      Widget? screen,
      String? animationStyle,
      String? path,
      dynamic extra,
      Map<String, dynamic>? queryParameters,
      String? name}) async {
    assert(screen != null || name != null || path != null);

    AppHelpers.dismissKeyboard();

    if (name != null) {
      return context.pushReplacementNamed(name,
          extra: extra, queryParameters: queryParameters ?? {});
    }

    if (path != null) {
      return context.pushReplacement(path, extra: extra);
    }

    return await Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => screen!));
  }

  static dynamic go({
    required BuildContext context,
    Widget? screen,
    String? animationStyle,
    String? path,
    Map<String, dynamic>? queryParameters,
    String? name,
    dynamic extra,
  }) async {
    assert(screen != null || name != null || path != null);

    AppHelpers.dismissKeyboard();

    if (name != null) {
      return context.goNamed(name,
          extra: extra, queryParameters: queryParameters ?? {});
    }

    if (path != null) {
      return context.go(path, extra: extra);
    }

    return await Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => screen!), (_) => false);
  }

  static dynamic pop(
      {required BuildContext context, dynamic data, bool named = true}) {
    if (named) {
      return context.pop(data);
    }
    return Navigator.pop(context, data);
  }

  static bool canPop({required BuildContext context, bool named = false}) {
    if (named) {
      return context.canPop();
    }
    return Navigator.canPop(context);
  }
}
