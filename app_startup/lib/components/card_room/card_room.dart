import 'package:app_startup/components/customSwitch/custom_switch.dart';
import 'package:app_startup/screen/view_list_devices.dart';
import 'package:flutter/material.dart';

import 'package:app_startup/constants/color_app.dart';
import 'package:app_startup/constants/string_app.dart';

// ignore: must_be_immutable
class CardRoom extends StatefulWidget {
  bool isOn;
  String roomName;
  int number;
  String image;
  double screenWidth = 0;
  // final ValueChanged<int> viewListDevices;

  CardRoom({
    super.key,
    required this.isOn,
    required this.roomName,
    required this.number,
    required this.image,
    // required this.viewListDevices,
  });

  @override
  State<CardRoom> createState() => CardRoomState();
}

class CardRoomState extends State<CardRoom> {
  void _viewListDevices() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ViewListDevicesPage(roomName: widget.roomName),
      ));
    });
  }

  void _changeState() {
    setState(() {
      widget.isOn = !widget.isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: _viewListDevices,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: cardRoomBg,
          border: Border.all(
            color: const Color(0x80FFFFFF), // Stroke color
            width: 1, // Stroke width
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          boxShadow: [customBoxShadow],
        ),
        width: widget.screenWidth * 0.36,
        height: 210,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(22), topRight: Radius.circular(22)),
              child: Image.asset(
                widget.image,
                width: widget.screenWidth * 0.36,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(
                widget.roomName,
                style: const TextStyle(
                    height: 1, fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
              child: Text(
                '${widget.number} devices',
                style: const TextStyle(fontSize: 14, color: numberDevicesCl),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.isOn ? stateOn : stateOff,
                      style: const TextStyle(
                          height: 2, fontWeight: FontWeight.bold, fontSize: 14)),
                  CustomSwitch(isOn: widget.isOn, changeStateOnOff: (value) {
                    setState(() {
                      widget.isOn = value;
                    });
                  },),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
