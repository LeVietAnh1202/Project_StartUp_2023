import 'package:app_startup/components/customSwitch/custom_switch.dart';
import 'package:app_startup/constants/color_app.dart';
import 'package:app_startup/screen/statistic_page.dart';
import 'package:firebase_database/firebase_database.dart';
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
  late DatabaseReference _isOnRef, _currentRef, _voltageRef, _energyRef, _powerRef;
  double _current = 0.0, _voltage = 0.0, _energy = 0.0, _power = 0.0;

  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();

    String isOnPath = 'Flutter/Monitor1/isOn';
    String nowPath = 'ESP8266/Now1';

    setState(() {
      _isOnRef = FirebaseDatabase.instance.ref().child(isOnPath);
      _currentRef = FirebaseDatabase.instance.ref().child('$nowPath/Current');
      _voltageRef = FirebaseDatabase.instance.ref().child('$nowPath/Voltage');
      _energyRef = FirebaseDatabase.instance.ref().child('$nowPath/Energy');
      _powerRef = FirebaseDatabase.instance.ref().child('$nowPath/Power');
    });

    _currentRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          _current = (event.snapshot.value as num).toDouble();
        });
      }
    });

    _voltageRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          _voltage = (event.snapshot.value as num).toDouble();
        });
      }
    });

    _energyRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          _energy = (event.snapshot.value as num).toDouble();
        });
      }
    });
    
    _powerRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          _power = (event.snapshot.value as num).toDouble();
        });
      }
    });

    _isOnRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          widget.isOn = (event.snapshot.value as num == 1) ? true : false;
        });
      }
    });
  }

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
                                    widget.isOn = value;
                                    _isOnRef.set(value ? 1 : 0);
                                  },)),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                alignment: Alignment.topCenter,
                                child: Column(children: [
                                  Text(
                                    // "3.2",
                                     _energy.toStringAsFixed(3),
                                    style: const TextStyle(
                                        color: darkText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "Electric number",
                                    // "Số điện (kWh)",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const Text(
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
                  child: Column(children: [
                    Text(
                      // "223.55",
                      _voltage.toStringAsFixed(2),
                      style: const TextStyle(
                          color: darkText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Voltage (V)",
                      style: TextStyle(fontSize: 14),
                    ),
                  ]),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child:  Column(children: [
                    Text(
                      // "500.06",
                      _power.toStringAsFixed(5).replaceAll(RegExp(r"(\.0*|0*)$"), ""),
                      style: const TextStyle(
                          color: darkText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Wattage (W)",
                      style: TextStyle(fontSize: 14),
                    ),
                  ]),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Column(children: [
                    Text(
                      // "8.01",
                      _current.toString(),
                      style: const TextStyle(
                          color: darkText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
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
