// import 'dart:ffi';

import 'package:app_startup/components/card_timer/card_timer.dart';
import 'package:app_startup/components/card_timer/card_timer.dart';
import 'package:app_startup/constants/color_app.dart';
import 'package:app_startup/constants/string_app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// ignore: must_be_immutable
class ManagerPage extends StatefulWidget {
  ManagerPage({
    super.key,
    // required this.changeSelectedIndex,
  });

  @override
  State<ManagerPage> createState() => ManagerPageState();
}

class ManagerPageState extends State<ManagerPage> {
  // This widget is the root of your application.
  final DatabaseReference _temperatureRef =
      FirebaseDatabase.instance.reference().child(voltageThresholdPath);

  @override
  void initState() {
    // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    //     FlutterLocalNotificationsPlugin();
    // const AndroidInitializationSettings androidInitializationSettings =
    //     AndroidInitializationSettings('@mipmap/ic_laucher');
    // const DarwinInitializationSettings darwinInitializationSettings =
    //     DarwinInitializationSettings();
    // const InitializationSettings initializationSettings =
    //     InitializationSettings(
    //         android: androidInitializationSettings,
    //         iOS: darwinInitializationSettings);
    // const AndroidNotificationChannel channel = AndroidNotificationChannel(
    //     'messages', 'Messages',
    //     description: 'This is for flutter firebase',
    //     importance: Importance.max);

    // createChannel(channel);
    // flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // FirebaseMessaging.onMessage.listen((event) {
    //   final notification = event.notification;
    //   final android = event.notification?.android;
    //   if (notification != null && android != null) {
    //     flutterLocalNotificationsPlugin.show(
    //         notification.hashCode,
    //         notification.title,
    //         notification.body,
    //         NotificationDetails(
    //             android: AndroidNotificationDetails(channel.id, channel.name,
    //                 channelDescription: channel.description,
    //                 icon: android.smallIcon)));
    //   }
    // });

    super.initState();
  }

  // Hiển thị thông báo
  Future<void> _showNotification(String title, String message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: darwinInitializationSettings);
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'messages', 'Messages',
        description: 'This is for flutter firebase',
        importance: Importance.max);

    await flutterLocalNotificationsPlugin.show(
      0, // ID thông báo
      title,
      message,
      platformChannelSpecifics,
      payload: 'item x', // Dữ liệu tùy chỉnh
    );

    createChannel(channel);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // await flutterLocalNotificationsPlugin.show(
    //         123,
    //         'Title message',
    //         'Body message',
    //         NotificationDetails(
    //             android: AndroidNotificationDetails(channel.id, channel.name,
    //                 channelDescription: channel.description)));

    FirebaseMessaging.onMessage.listen((event) {
      print('Firebase Message: ');
      final notification = event.notification;
      final android = event.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    channelDescription: channel.description,
                    icon: android.smallIcon)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _temperatureRef.onValue.listen((event) {
      final temperature = (event.snapshot.value as num).toDouble();

      // Kiểm tra nhiệt độ và hiển thị thông báo
      if (temperature > 30.0) {
        print(temperature);
        _showNotification('Nhiệt độ cao!', 'Nhiệt độ hiện tại: $temperature');
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          "Manager Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const Center(
        child: Text('Listening to Temperature Changes...'),
      ),
    );
  }

  void createChannel(AndroidNotificationChannel channel) async {
    final FlutterLocalNotificationsPlugin plugin =
        FlutterLocalNotificationsPlugin();
    await plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }
}
