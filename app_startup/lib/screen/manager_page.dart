// import 'dart:ffi';

import 'package:app_startup/constants/color_app.dart';
import 'package:app_startup/constants/string_app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

// ignore: must_be_immutable
class ManagerPage extends StatefulWidget {
  num wordsReceived;
  num wordsSent = 220.5;
  // final ValueChanged<int> changeSelectedIndex;

  ManagerPage({
    super.key,
    this.wordsReceived = 0,
    // required this.changeSelectedIndex,
  });

  @override
  State<ManagerPage> createState() => ManagerPageState();
}

class ManagerPageState extends State<ManagerPage> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = FirebaseDatabase.instance.ref();

    DatabaseReference starCountRef = database.ref('${historyMonitor1Path}2023/8/16/23/43/');
    starCountRef.onValue.listen((DatabaseEvent event) {
      final Map<dynamic, dynamic> data = event.snapshot.value as Map<dynamic, dynamic>;
      setState(() {
        // widget.wordsReceived = data;
        print(data);
      });
    });

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
            onPressed: () async {
              setState(() {
                widget.wordsSent++;
                print("wordsSent: " + widget.wordsSent.toString());
              });
              await starCountRef.set(widget.wordsSent);
            }, // Firebase sent
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
          Text(widget.wordsReceived.toString())
        ],
      )),
    );
  }
}
