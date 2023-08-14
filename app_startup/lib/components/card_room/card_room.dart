import 'package:app_startup/constants/color_app.dart';
import 'package:app_startup/constants/string_app.dart';
import 'package:flutter/material.dart';

class CardRoom extends StatefulWidget {
  String state;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.center;
  Color switchBg1 = Colors.grey, switchBg2 = Colors.grey;
  double screenWidth = 0;

  CardRoom({
    super.key,
    required this.state,
  }) {
    if (state == stateOn) {
      _mainAxisAlignment = MainAxisAlignment.end;
      switchBg1 = switchOffBg1;
      switchBg2 = switchOffBg2;
      state = stateOff;
    } else {
      _mainAxisAlignment = MainAxisAlignment.start;
      switchBg1 = switchOnBg1;
      switchBg2 = switchOnBg2;
      state = stateOn;
    }
  }

  @override
  State<CardRoom> createState() => CardRoomState();
}

class CardRoomState extends State<CardRoom> {
  void _changeState() {
    setState(() {
      if (widget.state == stateOn) {
        widget._mainAxisAlignment = MainAxisAlignment.end;
        widget.switchBg1 = switchOffBg1;
        widget.switchBg2 = switchOffBg2;
        widget.state = stateOff;
      } else {
        widget._mainAxisAlignment = MainAxisAlignment.start;
        widget.switchBg1 = switchOnBg1;
        widget.switchBg2 = switchOnBg2;
        widget.state = stateOn;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: cardRoomBg,
        border: Border.all(
          color: const Color(0x80FFFFFF), // Stroke color
          width: 1, // Stroke width
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3B4D56).withOpacity(0.16), // Shadow color
            blurRadius: 6, // Spread radius
            offset: const Offset(2, 2), // Offset in x and y direction
          ),
        ],
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
              'assets/images/living-room.png',
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Text(
              'Living room',
              style: TextStyle(
                  height: 1, fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
            child: Text(
              '4 devices',
              style: TextStyle(fontSize: 14, color: numberDevicesCl),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.state,
                    style: const TextStyle(
                        height: 2, fontWeight: FontWeight.bold, fontSize: 14)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GestureDetector(
                    onTap: _changeState,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [switchOnOffBg1, switchOnOffBg2],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      height: 31,
                      width: 51,
                      child: Row(
                        mainAxisAlignment: widget._mainAxisAlignment,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(2),
                            height: 27,
                            width: 27,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [widget.switchBg1, widget.switchBg2],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
