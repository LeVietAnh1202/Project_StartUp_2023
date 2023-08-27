import 'package:app_startup/constants/string_app.dart';
import 'package:fl_chart/fl_chart.dart';

class DataLineChartModel {
  late String option;
  late List<double> data;
  late List<FlSpot> allSpots;

  DataLineChartModel({required this.option, required this.data}) {
    setallSpots();
  }

  void setallSpots() {
    int num = 0;
    switch (option) {
      case fifteenMinutes:
        num = 16;
      case thirtyMinutes:
        num = 31;
      case oneHour:
        num = 61;
      case oneDay:
        num = 25;
    }
    allSpots =
        List<FlSpot>.generate(num, (index) => FlSpot(index.toDouble(), 0));

    for (int i = 0; i < data.length; i++) {
      allSpots[i] = FlSpot(i.toDouble(), data[i].toDouble());
    }
  }

  String? textBottomTitle(double value) {
    switch (option) {
      case fifteenMinutes:
        return fifteenMinutesTextBottomTitle.containsKey(value)
            ? fifteenMinutesTextBottomTitle[value]
            : '-1';
      case thirtyMinutes:
        return thirtyMinutesTextBottomTitle.containsKey(value)
            ? thirtyMinutesTextBottomTitle[value]
            : '-1';
      case oneHour:
        return oneHourTextBottomTitle.containsKey(value)
            ? oneHourTextBottomTitle[value]
            : '-1';
      case oneDay:
        return oneDayTextBottomTitle.containsKey(value)
            ? oneDayTextBottomTitle[value]
            : '-1';
    }
    return null;
  }

  List<FlSpot> get getAllSpots => allSpots;
}

Map<int, String> fifteenMinutesTextBottomTitle = {
  0: '0',
  1: '1',
  2: '2',
  3: '3',
  4: '4',
  5: '5',
  6: '6',
  7: '7',
  8: '8',
  9: '9',
  10: '10',
  11: '11',
  12: '12',
  13: '13',
  14: '14',
  15: '15',
};

Map<int, String> thirtyMinutesTextBottomTitle = {
  // 0: '0',
  // 2: '2',
  // 4: '4',
  // 6: '6',
  // 8: '8',
  // 10: '10',
  // 12: '12',
  // 14: '14',
  // 16: '16',
  // 18: '18',
  // 20: '20',
  // 22: '22',
  // 24: '24',
  // 26: '26',
  // 28: '28',
  // 30: '30',
  0: '0',
  5: '5',
  10: '10',
  15: '15',
  20: '20',
  25: '25',
  30: '30',
};

Map<int, String> oneHourTextBottomTitle = {
  0: '0',
  5: '5',
  10: '10',
  15: '15',
  20: '20',
  25: '25',
  30: '30',
  35: '35',
  40: '40',
  45: '45',
  50: '50',
  55: '55',
  60: '60',
};

Map<int, String> oneDayTextBottomTitle = {
  0: '0',
  2: '2',
  4: '4',
  6: '6',
  8: '8',
  10: '10',
  12: '12',
  14: '14',
  16: '16',
  18: '18',
  20: '20',
  22: '22',
  24: '24',
};
