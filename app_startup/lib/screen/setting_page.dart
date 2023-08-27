import 'package:app_startup/components/line_chart/line_chart_sample5.dart';
import 'package:app_startup/components/segment_control/segment_control.dart';
import 'package:app_startup/constants/color_app.dart';
import 'package:app_startup/constants/string_app.dart';
import 'package:app_startup/models/data_line_chart/data.dart';
import 'package:flutter/material.dart';

class LineChartStatistic extends StatefulWidget {
  final int initialSegmentControlIndex;

  const LineChartStatistic({
    Key? key,
    this.initialSegmentControlIndex = 0,
  }) : super(key: key);

  @override
  State<LineChartStatistic> createState() => LineChartStatisticState();
}

class LineChartStatisticState extends State<LineChartStatistic> {
  // This widget is the root of your application.
  late int segmentControlIndex;
  List<String> contentListSegmentControl = const [
    '15min',
    '30min',
    '1h',
    '1d',
    '1mo',
    '1yr'
  ];
  late List<double> data;

  @override
  void initState() {
    super.initState();
    segmentControlIndex = widget.initialSegmentControlIndex;
    data = _setData()!;
  }

  void _setSegmentControlIndex(int index) {
    setState(() {
      segmentControlIndex = index;
      data = _setData()!;
    });
  }

  List<double>? _setData() {
    switch (contentListSegmentControl[segmentControlIndex]) {
      case fifteenMinutes:
        return fifteenMinutesData;
      case thirtyMinutes:
        return thirtyMinutesData;
      case oneHour:
        return oneHourData;
      case oneDay:
        return oneDayData;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(
            height: 20,
          ),
          SegmentControl(
              selectedIndex: segmentControlIndex,
              items: contentListSegmentControl,
              getSelectedIndex: _setSegmentControlIndex),
          LineChartSample5(
              option: contentListSegmentControl[segmentControlIndex],
              data: data),
        ],
      ),
    );
  }
}
