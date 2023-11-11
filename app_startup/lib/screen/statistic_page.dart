import 'package:app_startup/components/line_chart/line_chart_sample5.dart';
import 'package:app_startup/components/segment_control/segment_control.dart';
import 'package:app_startup/constants/color_app.dart';
import 'package:app_startup/constants/string_app.dart';
import 'package:app_startup/models/data_line_chart/data.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StatisticPage extends StatefulWidget {
  final int initialSegmentControlIndex;

  const StatisticPage({
    Key? key,
    this.initialSegmentControlIndex = 0,
  }) : super(key: key);

  @override
  State<StatisticPage> createState() => StatisticPageState();
}

class StatisticPageState extends State<StatisticPage> {
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
  List<double>? data;
  double lastMonthPercen = 112 / 200;
  double thisMonthPercen = 50 / 200;

  @override
  void initState() {
    super.initState();
    segmentControlIndex = widget.initialSegmentControlIndex;
    initData();
  }

  void initData() async {
    data = await _setData();
  }

  void _setSegmentControlIndex(int index)  {
    setState(() {
      segmentControlIndex = index;
      initData();
    });
  }

  Future<List<double>?> _setData() async {
    switch (contentListSegmentControl[segmentControlIndex]) {
      case fifteenMinutes:
        List<double> p = await GetDataFromFirebase().fetchData();
        print('p: ');
        print(p);
        // return p;
        return fifteenMinutesData;
        // return GetDataFromFirebase().getFifteenMinutesData();
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
          "Statistic Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SegmentControl(
                    selectedIndex: segmentControlIndex,
                    items: contentListSegmentControl,
                    getSelectedIndex: _setSegmentControlIndex),
              ),
              LineChartSample5(
                  option: contentListSegmentControl[segmentControlIndex],
                  data: data == null ? [] : data!),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: greenDark.withOpacity(0.15),
                        ),
                        height: 120,
                        width: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Today'.toUpperCase(), style: TextStyle(fontWeight: FontWeight.w500, color: darkText50)),
                            const SizedBox(height: 5,),
                            const Text(
                              '3.0',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            ),
                            const SizedBox(height: 5,),
                            const Text(' kWh'),
                          ],
                        ),
                      ),
                    ),
                    Text('This month:'.toUpperCase(), style: TextStyle(fontWeight: FontWeight.w500, color: darkText50)),
                    const SizedBox(
                      height: 5,
                    ),
                    LinearPercentIndicator(
                      padding: const EdgeInsets.all(0.0),
                      width: MediaQuery.of(context).size.width - 40,
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2500,
                      percent: thisMonthPercen,
                      center: const Text("50 kWh", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, letterSpacing: 0.6),),
                      barRadius: const Radius.circular(10.0),
                      progressColor: buttonSegmentControl1.withOpacity(1),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Last month:'.toUpperCase(), style: TextStyle(fontWeight: FontWeight.w500, color: darkText50),),
                    const SizedBox(
                      height: 5,
                    ),
                    LinearPercentIndicator(
                      padding: const EdgeInsets.all(0.0),
                      width: MediaQuery.of(context).size.width - 40,
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2500,
                      percent: lastMonthPercen,
                      center: const Text("112 kWh", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, letterSpacing: 0.6),),
                      // linearStrokeCap: LinearStrokeCap.roundAll,
                      barRadius: const Radius.circular(10.0),
                      progressColor: greenDark
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Container(height: 150, width: double.infinity, color: Colors.amber,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
