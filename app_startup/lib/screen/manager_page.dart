import 'package:app_startup/constants/color_app.dart';
import 'package:flutter/material.dart';

class ManagerPage extends StatelessWidget {
  const ManagerPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String wordsSent, wordsReceived = "Hello";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          "Manager Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            height: 10,
          ),
          ElevatedButton(
            child: const Text("Sent"),
            onPressed: () {}, // Firebase sent
          ),
          Container(
            height: 10,
          ),
          ElevatedButton(
            child: const Text("Receive"),
            onPressed: () {}, // Firebase received
          ),
          Container(
            height: 10,
          ),
          Text(wordsReceived)
        ],
      )),
    );
  }
}
