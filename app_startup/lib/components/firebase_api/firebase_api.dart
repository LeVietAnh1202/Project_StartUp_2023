import 'dart:convert';

import 'package:app_startup/firebase_options.dart';
import 'package:app_startup/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print('Token: $fcmToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  // If application is in background, then it will work
  void onMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print('onMessageOpenedApp: $message');
      Navigator.pushNamed(navigatorKey.currentState!.context, '/push-page',
          arguments: {'message': json.encode(message.data)});
    });
  }

  // If app is closed or terminated
  void getInitialMessage() {
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        Navigator.pushNamed(navigatorKey.currentState!.context, '/push-name',
            arguments: {'message': json.encode(message.data)});
      }
    });
  }

  void onBackgroundMessage() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

    await Firebase.initializeApp();
    // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
    print("_firebaseMessagingBackgroundHandlers: $message");
  }
}
