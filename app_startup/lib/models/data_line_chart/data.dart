// import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

// List<double> fifteenMinutesData = [
//   100,
//   100,
//   90,
//   80,
//   70,
//   60,
//   50,
//   40,
//   45,
//   60,
//   70,
//   75,
//   80,
//   85,
//   90,
//   95,
// ];

List<double> fifteenMinutesData = [
  5.8,
  6.2,
  6.1,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  5.8,
  5.8,
  5.7,
  6.0,
  6.2
];

class GetDataFromFirebase {
  late DateTime now;
  // String formattedDate = DateFormat('dd/MM/yyyy').format(now);
  // String formattedTime = DateFormat('HH:mm:ss').format(now);
  // late List<double> fifteenMinutesData;

  // String getPath(DateTime now) {
  //   String path = '';
  //   if ()
  //   return path;
  // }

  Future<List<double>> fetchData() async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('ESP8266/Monitor1/History/2023');
    List<double> powerList = [];
    int count = 0;

    await databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      Map<dynamic, dynamic> newData =
          (dataSnapshot.value as Map<dynamic, dynamic>?) ?? {};
      // print(newData);
      // Lấy thời điểm hiện tại
      // DateTime currentTime = DateTime.now();
      DateTime currentTime = DateTime(2023, 10, 25, 10, 30);

      // Tính thời điểm 15 phút trước
      DateTime fifteenMinutesAgo =
          currentTime.subtract(const Duration(minutes: 15));
      DateTime time = currentTime;
      
      // for (var i = 0; i < 30 * 24 * 60; i++) {
      while (true) {
        print('${time.day} - ${time.month}, ${time.hour}:${time.minute}');
        Map<dynamic, dynamic> a = {};
        var monthData = newData['${time.month}'];
        bool ok = false;
        if (monthData != null) {
          var dayData = monthData['${time.day}'];
          if (dayData != null) {
            var hourData = dayData['${time.hour}'];
            if (hourData != null) {
              var minuteData = hourData['${time.minute}'];
              if (minuteData != null) {
                a = minuteData;
                ok = true;
                powerList.add(minuteData['Power']);
              }
            }
          }
        }
        if (!ok) {
          powerList.add(0);
        }
        time = time.subtract(const Duration(minutes: 1));
        // if (!time.isAfter(fifteenMinutesAgo)) break;
        if (count == 14) {
          break;
        }
        else {
          count += 1;
        }
      }
      print(powerList);

      // Tìm giá trị gần nhất trong 15 phút
      Map<dynamic, dynamic> latestDataInRange = {};
      // newData.forEach((year, yearData) {
      //   yearData.forEach((month, monthData) {
      //     monthData.forEach((day, dayData) {
      //       dayData.forEach((hour, hourData) {
      //         hourData.forEach((minute, minuteData) {
      //           DateTime entryTime = DateTime(
      //             int.parse(year),
      //             int.parse(month),
      //             int.parse(day),
      //             int.parse(hour),
      //             int.parse(minute),
      //           );
      //           if (entryTime.isAfter(fifteenMinutesAgo)) {
      //             latestDataInRange = minuteData;
      //           }
      //         });
      //       });
      //     });
      //   });
      // });

      // print(latestDataInRange);
    });
    print('out');
    print(powerList);
    return powerList;
  }

  List<double> getFifteenMinutesData() {
    fifteenMinutesData = [];
    now = DateTime.now();
    double _power;

    DatabaseReference _historyRef =
        FirebaseDatabase.instance.ref().child('ESP8266/Monitor1/History');
    _historyRef.onValue.listen((event) async {
      for (var i = 0; i < 15; i++) {
        now = now.subtract(const Duration(minutes: 1));
        DatabaseReference _powerRef = FirebaseDatabase.instance.ref().child(
            'ESP8266/Monitor1/History/${now.day}/${now.month}/${now.year}/${now.hour}/${now.minute}/Power');
        print(
            'ESP8266/Monitor1/History/${now.year}/${now.month}/${now.day}/${now.hour}/${now.minute}/Power');

        final event = await _powerRef.once(DatabaseEventType.value);
        if (event.snapshot.value != null) {
          _power = (event.snapshot.value as num).toDouble();
          fifteenMinutesData.add(_power);
        }
      }
    });

    return fifteenMinutesData;
  }
}

List<double> thirtyMinutesData = [
  50,
  40,
  45,
  60,
  70,
  75,
  80,
  85,
  90,
  95,
  100,
  105,
  110,
  120,
  85,
  90,
  95,
  100,
  105,
  130,
  140,
  40,
  45,
  60,
  70,
  75,
  80,
  110,
  120,
  130,
  140,
];

List<double> oneHourData = [
  100,
  100,
  90,
  80,
  70,
  60,
  50,
  40,
  45,
  60,
  70,
  75,
  80,
  85,
  90,
  95,
  100,
  105,
  110,
  120,
  130,
  140,
  120,
  110,
  100,
  100,
  100,
  90,
  80,
  70,
  60,
  50,
  40,
  45,
  60,
  70,
  75,
  80,
  85,
  90,
  95,
  100,
  105,
  110,
  120,
  130,
  140,
  120,
  110,
  100,
  90,
  95,
  100,
  105,
  110,
  120,
  130,
  140,
  120,
  110,
  100,
];

List<double> oneDayData = [
  100,
  100,
  90,
  80,
  70,
  60,
  50,
  40,
  45,
  60,
  70,
  75,
  80,
  85,
  90,
  95,
  100,
  105,
  110,
  120,
  130,
  140,
  120,
  110,
  100,
];
