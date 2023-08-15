import 'package:app_startup/constants/color_app.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          "Notification Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const Text('Notification page'),
    );
  }
}
