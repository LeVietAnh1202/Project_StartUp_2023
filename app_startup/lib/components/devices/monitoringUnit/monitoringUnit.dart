import 'package:app_startup/components/customSwitch/custom_switch.dart';
import 'package:app_startup/constants/color_app.dart';
import 'package:app_startup/screen/statistic_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MonitoringUnitPage extends StatefulWidget {
  bool isOn;

  MonitoringUnitPage({
    super.key,
    required this.isOn,
  });

  @override
  State<MonitoringUnitPage> createState() => MonitoringUnitPageState();
}

// ignore: must_be_immutable
class MonitoringUnitPageState extends State<MonitoringUnitPage> {
  void _toStaticPage() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const StatisticPage(),
      ));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toStaticPage,
      child: Container(
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
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                            'assets/images/Bo-giam-sat.jpg',
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
                                'Monitoring Unit',
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
                                  child: CustomSwitch(isOn: widget.isOn, changeStateOnOff: (value) {
                                    
                                  },)),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                alignment: Alignment.topCenter,
                                child: const Column(children: [
                                  Text(
                                    // "3.2",
                                    "0.0",
                                    style: TextStyle(
                                        color: darkText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Electric number",
                                    // "Số điện (kWh)",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    "(kWh)",
                                    // "Số điện (kWh)",
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: const Column(children: [
                    Text(
                      // "223.55",
                      "0.0",
                      style: TextStyle(
                          color: darkText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Voltage (V)",
                      style: TextStyle(fontSize: 14),
                    ),
                  ]),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: const Column(children: [
                    Text(
                      // "500.06",
                      "0.0",
                      style: TextStyle(
                          color: darkText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Wattage (W)",
                      style: TextStyle(fontSize: 14),
                    ),
                  ]),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: const Column(children: [
                    Text(
                      // "8.01",
                      "0.0",
                      style: TextStyle(
                          color: darkText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Current (A)",
                      style: TextStyle(fontSize: 14),
                    ),
                  ]),
                ),
              ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
