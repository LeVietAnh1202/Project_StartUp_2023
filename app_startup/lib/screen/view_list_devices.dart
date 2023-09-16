import 'package:app_startup/components/devices/monitoringUnit/monitoringUnit.dart';
import 'package:app_startup/components/devices/socket/socket.dart';
import 'package:app_startup/constants/color_app.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewListDevicesPage extends StatelessWidget {
  String roomName;

  ViewListDevicesPage({super.key, required this.roomName});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          roomName,
          style: const TextStyle(color: darkText, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        color: grayBackground,
        height: double.infinity,
        // child: Expanded(
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    SocketPage(isOn: true),
                    const SizedBox(
                      height: 20,
                    ),
                    MonitoringUnitPage(
                      isOn: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        // ),
      ),
    );
  }
}
