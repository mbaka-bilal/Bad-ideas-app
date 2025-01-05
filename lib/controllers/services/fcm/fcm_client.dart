// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../../models/notification_model.dart';
import '../../../core/utils/helpers.dart';
import 'local_notifications.dart';
import 'notification_dispatcher.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

class FCMClient {
  FCMClient._();

  static final FCMClient instance = FCMClient._();

  static bool _isInit = false;
  final _localNotifications = LocalNotifications();

  /// Stream of messages when app is opened in foreground.
  late StreamSubscription _onMessageSub;

  /// Stream of messages when app is in background and opened from notification.
  late StreamSubscription _onMessageOpenedAppSub;

  /// Stream for detecting FCM token refresh
  Stream<String> get tokenRefreshStream => _firebaseMessaging.onTokenRefresh;

  Future<void> requestPermission() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<String?> init(Function(String token) onUpdateToken) async {
    if (_isInit) {
      final token = await _firebaseMessaging.getToken();

      return token;
    }

    requestPermission();

    if (Platform.isAndroid) {
      await FirebaseMessaging.instance.setAutoInitEnabled(true);
    }

    final token = await _firebaseMessaging.getToken();

    _isInit = true;

    if (token != null) {
      _updateToken(token, onUpdateToken);
    }

    _firebaseMessaging.onTokenRefresh.listen((token) {
      _updateToken(token, onUpdateToken);
    });

    return token;
  }

  void _updateToken(String token, Function(String token) onUpdateToken) {
    onUpdateToken(token);
  }

  void disableMessagesHandle() {
    _onMessageSub.cancel();
    _onMessageOpenedAppSub.cancel();
  }

  void initOnTapListeners(
    BuildContext context,
  ) async {
    final initialMessage = await _firebaseMessaging.getInitialMessage();

    //Coming from app launch
    if (initialMessage?.data != null) {
      AppHelpers.printToLog(
          message: "initial message is ${initialMessage!.data}");
      Future.delayed(const Duration(seconds: 2),
          () => _onTapNotification(context, initialMessage.data));
    }

    //App in foreground
    _onMessageSub = FirebaseMessaging.onMessage
        .listen((event) => _onMessage(context, event));

    //App in background
    _onMessageOpenedAppSub = FirebaseMessaging.onMessageOpenedApp
        .listen((event) => _onMessageOpenedApp(context, event));

    // Flutter local notifications handler
    // shown when app is in foreground
    await _localNotifications.init(
      onDidReceiveNotificationResponse: (data) =>
          _onDidReceiveNotificationResponse(context, data),
    );
  }

  //App in foreground
  Future<void> _onMessage(BuildContext context, RemoteMessage message) async {
    _log(message, name: 'onMessage');

    await _localNotifications.show(
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      payload: jsonEncode(message.data),
    );
  }

  //Firebase notification opened, when app is in background
  void _onMessageOpenedApp(BuildContext context, RemoteMessage message) async {
    _log(message, name: 'onMessageOpenedApp');
    _onTapNotification(context, message.data);
  }

  //Flutter local notifications handler
  Future<void> _onDidReceiveNotificationResponse(
    BuildContext context,
    NotificationResponse? notificationResponse,
  ) async {
    if (notificationResponse?.payload != null) {
      final payload = notificationResponse?.payload;
      final payloadModel = await jsonDecode(payload ?? "{}");

      _log(RemoteMessage(data: payloadModel),
          name: 'onDidReceiveNotificationResponse');
      await _onTapNotification(context, payloadModel);
    }
  }

  Future<void> _onTapNotification(
      BuildContext context, Map<String, dynamic>? payload) async {
    if (payload != null) {
      final model = NotificationPayloadModel.fromJson(payload);
      NotificationDispatcher.handle(context: context, payload: model);
    }
  }

  void _log(RemoteMessage? message, {String? name}) {
    if (message != null) {
      AppHelpers.printToLog(
          message: '$name: title ${message.notification?.title}, '
              'body: ${message.notification?.body}, '
              'data: ${message.data}',
          level: LogLevel.debug);
    }
  }
}
