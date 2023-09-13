import 'package:app_startup/components/card_timer/box_timer.dart';
import 'package:app_startup/constants/color_app.dart';
import 'package:app_startup/constants/string_app.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardTimer extends StatefulWidget {
  String imgPath, deviceName;
  CardTimer({super.key, required this.imgPath, required this.deviceName});

  @override
  State<CardTimer> createState() => _CardTimerState();
}

class _CardTimerState extends State<CardTimer> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: cardRoomBg,
        elevation: 2.0,
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFFFFFFF),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                                // 'assets/images/Bo-giam-sat.jpg',
                                widget.imgPath)),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),

                          alignment: Alignment.center,
                          height: 60,
                          child: Text(
                            // 'Monitoring Unit',
                            widget.deviceName,
                            style: const TextStyle(
                                color: darkText,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ]),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      BoxTimer(onOffText: on),
                      BoxTimer(
                        onOffText: off,
                      ),
                    ],
                  ),
                ]))));
  }
}
