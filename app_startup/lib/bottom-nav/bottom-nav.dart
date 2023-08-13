import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> incrementCounter;

  const BottomNav({
    required this.selectedIndex,
    required this.incrementCounter,
  });

  @override
  State<BottomNav> createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // selectedFontSize: 14,
      // selectedIconTheme: const IconThemeData(color: Colors.amberAccent, size: 40),
      selectedItemColor: const Color(0xFF1a7d5a),
      // selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: 'Setting',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_outlined),
          label: 'Notification',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_outlined),
          label: 'Manager',
        ),
      ],
      currentIndex: widget.selectedIndex,
      onTap: widget.incrementCounter,
    );
  }
}
