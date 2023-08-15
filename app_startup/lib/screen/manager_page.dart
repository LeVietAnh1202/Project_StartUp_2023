import 'package:flutter/material.dart';

class ManagerPage extends StatelessWidget {
  const ManagerPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String wordsSent, wordsReceived = "Hello";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Manager Page"),
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
