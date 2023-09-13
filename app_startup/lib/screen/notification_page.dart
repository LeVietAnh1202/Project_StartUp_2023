// import 'package:app_startup/constants/color_app.dart';
// import 'package:flutter/material.dart';

// class NotificationPage extends StatelessWidget {
//   const NotificationPage({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appBarColor,
//         title: const Text(
//           "Notification Page",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: const Text('Notification page'),
//     );
//   }
// }

import 'package:app_startup/components/card_setting_threshold/card_setting_threshold.dart';
import 'package:app_startup/constants/string_app.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:app_startup/components/customSwitch/custom_switch.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:app_startup/constants/color_app.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});


  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final DatabaseReference _voltageRef =
      FirebaseDatabase.instance.reference().child(voltageThresholdPath);
  double voltageThreshold = 100.0; // Giá trị mức điện áp muốn cảnh báo
  double _voltage = 0.0;
  bool enableAlert = false; // Biến để bật hoặc tắt thông báo cảnh báo

  TextEditingController voltageController = TextEditingController();
  bool isEditing = false;

  // @override
  // void initState() {
  //   super.initState();
  //   voltageController.text = voltageThreshold.toString();
  // }

  @override
  void initState() {
    super.initState();
    _voltageRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          _voltage = (event.snapshot.value as num).toDouble();
          voltageController.text = _voltage.toString();
        });
      }
    });
  }

  void toggleEdit() {
    setState(() {
      if (isEditing) {
        // Lưu giá trị mới và chuyển sang chế độ xem
        _voltage = double.parse(voltageController.text);
        // voltageThreshold = double.parse(voltageController.text);
        _voltageRef.set(_voltage); // Cập nhật giá trị lên Firebase
      }
      isEditing = !isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          'Thiết lập mức cảnh báo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: grayBackground,
        height: double.infinity,
        padding: const EdgeInsets.all(16.0),
        // child: Text(),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            CartSettingThreshold(thresholdText: voltageThresholdText, notiText: voltageNotiText,),
            const SizedBox(height: 20,),
            CartSettingThreshold(thresholdText: amperageThresholdText, notiText: amperageNotiText,),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    voltageController.dispose();
    super.dispose();
  }
}
