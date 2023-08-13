import 'package:app_startup/screen/home-page.dart';
import 'package:app_startup/screen/manager-page.dart';
import 'package:app_startup/screen/notification-page.dart';
import 'package:app_startup/screen/setting-page.dart';
import 'package:flutter/material.dart';

import 'bottom-nav/bottom-nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pageList = const <Widget>[
    HomePage(),
    SettingPage(),
    NotificationPage(),
    ManagerPage(),
  ];

  int _selectedIndex = 0;

  void _incrementCounter(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_selectedIndex],
      bottomNavigationBar: BottomNav(selectedIndex: _selectedIndex, incrementCounter: _incrementCounter),
    );
  }
}
