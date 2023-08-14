import 'package:app_startup/screen/main_screen.dart';
import 'package:flutter/material.dart';

import 'package:app_startup/constants/color_app.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.64; // 50% of the screen width

    void navigateToMainScreen(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    }

    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: buttonWidth),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: whiteText,
            backgroundColor: greenDark,
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9.0),
            )),
        onPressed: () {
          navigateToMainScreen(context);
        },
        child: const Text('LOGIN',
            style: TextStyle(
              fontSize: 20.0,
              height: 2,
            )),
      ),
    );
  }
}
