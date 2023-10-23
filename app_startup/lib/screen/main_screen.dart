import 'package:app_startup/components/card_timer/card_timer.dart';
import 'package:app_startup/screen/timer_screen.dart';
import 'package:flutter/material.dart';

import 'package:app_startup/screen/home_page.dart';
import 'package:app_startup/screen/manager_page.dart';
import 'package:app_startup/screen/notification_page.dart';
import 'package:app_startup/screen/setting_page.dart';

import 'package:app_startup/components/bottom-nav/bottom_nav.dart';

import '../login_signup/login_form.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pageList = <Widget>[
    const HomePage(),
    // const LineChartStatistic(),
    const NotificationPage(),
    // ManagerPage(),
    // const Login()
  ];

  int _selectedIndex = 0;

  void _changeSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_selectedIndex],
      bottomNavigationBar: BottomNav(selectedIndex: _selectedIndex, changeSelectedIndex: _changeSelectedIndex),
    );
  }
}