import 'package:app_startup/components/line_chart/line_chart_sample5.dart';
import 'package:app_startup/components/segment_control/segment_control.dart';
import 'package:app_startup/constants/color_app.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    void getSelectedIndex(int index) {
      print(index);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          "Setting Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          SegmentControl(selectedIndex: 0, items: const ['15min', '30min', '1h', '1d', '1mo', '1yr'], getSelectedIndex: getSelectedIndex),
          const LineChartSample5(),
        ],
      ),
    );
  }
}
