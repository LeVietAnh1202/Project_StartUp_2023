import 'package:flutter/material.dart';

class ManagerPage extends StatelessWidget {
  const ManagerPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Manager Page"),
      ),
      body: const Text('Manager page'),
    );
  }
}
