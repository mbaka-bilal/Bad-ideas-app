import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum Status { initial, loading, success, error, noNetwork, notVerified }

class BaseState<T> {
  final Status status;
  final String? errorMessage;
  final T? data;

  BaseState({
    required this.status,
    this.errorMessage,
    this.data,
  });

  factory BaseState.initial() {
    return BaseState<T>(status: Status.initial);
  }

  factory BaseState.loading({T? data}) {
    return BaseState<T>(status: Status.loading, data: data);
  }

  factory BaseState.success(T data) {
    return BaseState<T>(status: Status.success, data: data);
  }

  factory BaseState.error(String errorMessage,
      {exception, stackTrace, T? data}) {
    Fluttertoast.showToast(
      msg: "Error: $errorMessage",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    return BaseState<T>(
        status: Status.error, errorMessage: errorMessage, data: data);
  }

  bool get isInitial => status == Status.initial;

  bool get isLoading => status == Status.loading;

  bool get isSuccess => status == Status.success;

  bool get isError => status == Status.error;
}
