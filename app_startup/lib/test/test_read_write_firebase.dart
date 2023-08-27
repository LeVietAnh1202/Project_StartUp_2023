// import 'dart:ffi';

import 'package:app_startup/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

// ignore: must_be_immutable
class TestReadWriteFirebasePage extends StatefulWidget {
  num wordsReceived;
  num wordsSent= 220.5;
  // final ValueChanged<int> changeSelectedIndex;

  TestReadWriteFirebasePage({
    super.key,
    this.wordsReceived = 230.5,
    // required this.changeSelectedIndex,
  });

  @override
  State<TestReadWriteFirebasePage> createState() => TestReadWriteFirebasePageState();
}

class TestReadWriteFirebasePageState extends State<TestReadWriteFirebasePage> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = FirebaseDatabase.instance.ref();

    DatabaseReference starCountRef = database.ref('Flutter/voltage');
    starCountRef.onValue.listen((DatabaseEvent event) {
      final num data = event.snapshot.value as num;
      setState(() {
        widget.wordsReceived = data;
        print(data.toString());
      });
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          "TestReadWriteFirebase Page",
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
