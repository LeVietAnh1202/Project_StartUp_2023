import 'package:app_startup/constants/color_app.dart';
import 'package:app_startup/constants/string_app.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class BoxTimer extends StatefulWidget {
  String onOffText;

  BoxTimer({super.key, required this.onOffText});

  @override
  State<BoxTimer> createState() => _BoxTimerState();
}

class _BoxTimerState extends State<BoxTimer> {
  bool stateSwitch = false;
  final double _opacity = 0.5;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  // ignore: no_leading_underscores_for_local_identifiers
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

    // ignore: use_build_context_synchronously
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

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: stateSwitch ? 1 : _opacity,
      duration: const Duration(milliseconds: 50),
      child: SizedBox(
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 30,
              child: Text(widget.onOffText,
                  style: TextStyle(
                      color: widget.onOffText == on ? greenDark : redDark,
                      fontWeight: FontWeight.bold)),
            ),
            Row(
              children: [
                Text(
                    '${DateFormat('dd-MM-yyyy').format(_selectedDate).split(' ')[0]} ${_selectedTime.format(context)}'),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                    width: 30,
                    child: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        icon: const Icon(Icons.access_time),
                        onPressed: () {
                          _selectDateTime(context);
                        })),
              ],
            ),
            SizedBox(
              width: 40,
              child: Transform.scale(
                scale: 0.65,
                child: Switch(
                    value: stateSwitch,
                    onChanged: (bool value) {
                      setState(() {
                        stateSwitch = value;
                      });
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
