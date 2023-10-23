import 'package:app_startup/components/card_timer/card_timer.dart';
import 'package:app_startup/constants/color_app.dart';
import 'package:app_startup/screen/timer_screen.dart';
import 'package:flutter/material.dart';

import 'package:app_startup/screen/home_page.dart';
import 'package:app_startup/screen/manager_page.dart';
import 'package:app_startup/screen/notification_page.dart';
import 'package:app_startup/screen/setting_page.dart';

import 'package:app_startup/components/bottom-nav/bottom_nav.dart';

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
  ];

  final PageController _pageIndex = PageController(initialPage: 0);

  int _selectedIndex = 0;

  void _changeSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _changePageIndex(int index) {
    setState(() {
      _pageIndex.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: AvatarGlow(
      //   animate: _isListening,
      //   glowColor: greenDark,
      //   endRadius: 75.0,
      //   duration: const Duration(milliseconds: 2000),
      //   repeatPauseDuration: const Duration(milliseconds: 100),
      //   repeat: true,
      //   child: FloatingActionButton(
      //     // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
      //     shape: const CircleBorder(),
      //     backgroundColor: greenDark,
      //     foregroundColor: Colors.white,
      //     onPressed: _listen,
      //     child: const Icon(Icons.mic_none),
      //   ),
      // ),
      floatingActionButton: const FloatingMicButton(),
      // body: pageList[_selectedIndex],
      // bottomNavigationBar: BottomNav(
      //     selectedIndex: _selectedIndex,
      //     changeSelectedIndex: _changeSelectedIndex),
      body: PageView(
        controller: _pageIndex,
        children: const [
          HomePage(),
          NotificationPage(),
        ],
      ),
      bottomNavigationBar: BottomNav(changePageIndex: _changePageIndex),
    );
  }

  
}
