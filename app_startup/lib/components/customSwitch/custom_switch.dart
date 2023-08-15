import 'package:app_startup/constants/color_app.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSwitch extends StatefulWidget {
  bool isOn;

  CustomSwitch({
    super.key,
    required this.isOn,
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  void _changeState() {
    setState(() {
      widget.isOn = !widget.isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
            mainAxisAlignment:
                widget.isOn ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(2),
                height: 27,
                width: 27,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: widget.isOn
                          ? ([switchOnBg1, switchOnBg2])
                          : ([switchOffBg1, switchOffBg2]),
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
