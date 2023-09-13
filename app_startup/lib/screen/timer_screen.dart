import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Startup App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Ngày đã chọn: ${DateFormat('dd-MM-yyyy').format(_selectedDate).split(' ')[0]}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              "Thời gian đã chọn: ${_selectedTime.format(context)}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Thêm logic của bạn ở đây để xử lý hẹn giờ.
              },
              child: const Text("Hẹn giờ"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _selectDateTime(context);
              },
              child: const Icon(Icons.access_time),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _selectDateTime(context);
        },
        child: const Icon(Icons.access_time),
      ),
    );
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TimerScreen(),
//     );
//   }
// }

// class TimerScreen extends StatefulWidget {
//   @override
//   _TimerScreenState createState() => _TimerScreenState();
// }

// class _TimerScreenState extends State<TimerScreen> {
//   DateTime _selectedDate = DateTime.now();
//   TimeOfDay _selectedTime = TimeOfDay.now();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hẹn giờ"),
//       ),
//       body: Column(
//         children: <Widget>[
//           SizedBox(
//             height: 20,
//           ),
//           Text(
//             "Chọn ngày hẹn giờ:",
//             style: TextStyle(fontSize: 18),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           ElevatedButton(
//             onPressed: _selectDate,
//             child: Text("Chọn ngày"),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Text(
//             "Chọn giờ hẹn giờ:",
//             style: TextStyle(fontSize: 18),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           ElevatedButton(
//             onPressed: _selectTime,
//             child: Text("Chọn giờ"),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(
//             onPressed: _scheduleTimer,
//             child: Text("Hẹn giờ"),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _selectDate() async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }

//   Future<void> _selectTime() async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: _selectedTime,
//     );
//     if (picked != null && picked != _selectedTime) {
//       setState(() {
//         _selectedTime = picked;
//       });
//     }
//   }

//   void _scheduleTimer() {
//     // Thực hiện logic để hẹn giờ bằng _selectedDate và _selectedTime
//     print("Hẹn giờ vào: $_selectedDate ${_selectedTime.format(context)}");
//     // Đặt hẹn giờ và thực hiện công việc cần thiết
//   }
// }
