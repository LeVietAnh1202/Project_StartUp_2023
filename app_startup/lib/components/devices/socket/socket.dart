import 'package:app_startup/components/customSwitch/custom_switch.dart';
import 'package:app_startup/constants/color_app.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SocketPage extends StatelessWidget {
  bool isOn;
  SocketPage({super.key, required this.isOn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: deviceBg,
        border: Border.all(
          color: const Color(0x80FFFFFF), // Stroke color
          width: 1, // Stroke width
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        boxShadow: [customBoxShadow],
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFFFFF),
                  ),
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/o-cam.webp',
                      )),
                )),
            Flexible(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.topCenter,
                          width: double.infinity,
                          child: const Text(
                            'Socket',
                            style: TextStyle(
                                color: darkText,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: CustomSwitch(isOn: isOn)),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            alignment: Alignment.topCenter,
                            child: const Column(children: [
                              Text(
                                "3.2 kWh",
                                style: TextStyle(
                                    color: darkText,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Số điện",
                                style: TextStyle(fontSize: 14),
                              ),
                            ]),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ]),
          Container(
            height: 20,
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  child: const Column(children: [
                    Text(
                      "223.55 V",
                      style: TextStyle(
                          color: darkText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Điện áp",
                      style: TextStyle(fontSize: 14),
                    ),
                  ]),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  child: const Column(children: [
                    Text(
                      "500.06 W",
                      style: TextStyle(
                          color: darkText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Công suất",
                      style: TextStyle(fontSize: 14),
                    ),
                  ]),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  child: const Column(children: [
                    Text(
                      "8.01 A",
                      style: TextStyle(
                          color: darkText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Dòng",
                      style: TextStyle(fontSize: 14),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
