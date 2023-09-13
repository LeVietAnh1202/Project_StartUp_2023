import 'package:app_startup/components/card_timer/card_timer.dart';
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
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        color: grayBackground,
        height: double.infinity,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Column(
                children: [
                  CardTimer(
                      imgPath: 'assets/images/Bo-giam-sat.jpg',
                      deviceName: 'Monitoring Unit'),
                  const SizedBox(
                    height: 10,
                  ),
                  CardTimer(
                      imgPath: 'assets/images/o-cam.webp', deviceName: 'Socket')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
