import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import 'utils/helpers.dart';
import 'utils/constant/constants.dart';

class AppExceptionHandler {
  static String handleException(
      {required Object exception, StackTrace? stackTrace}) {
    AppHelpers.printToLog(message: "Api Error:::: ${exception.toString()}");

    if (exception.runtimeType == DioException) {
      final error = exception as DioException;
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.connectionError ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.sendTimeout) {
        return AppConstants.ktimedOut;
      } else {
        // AppHelpers.printToLog(
        //     message:
        //         "Dio exception occurred \n $error  \n message: ${error.message} \n "
        //         "response is \n ${error.response?.data}");

        final response = error.response;
        String errorMessage = AppConstants.kUnknownError;

        if (response != null &&
            response.data.runtimeType != String &&
            response.data.runtimeType != int &&
            (response.data["message"] != null ||
                response.data["error"] != null)) {
          errorMessage = response.data["message"] ?? response.data["error"];
        }

        return errorMessage;
      }
    } else if (exception.runtimeType == TimeoutException ||
        exception.runtimeType == SocketException) {
      return AppConstants.ktimedOut;
    } else if (exception is String) {
      return exception;
    } else {
      return AppConstants.kUnknownError;
    }
  }
}

class UserNotVerifiedException implements Exception {
  final String message;

  UserNotVerifiedException() : message = AppConstants.kUserNotVerified;
}
