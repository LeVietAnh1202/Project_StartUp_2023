import 'package:app_startup/constants/color_app.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SegmentControl extends StatefulWidget {
  int selectedIndex;
  List<String> items;
  final ValueChanged<int> getSelectedIndex;

  SegmentControl({
    super.key,
    required this.selectedIndex,
    required this.items,
    required this.getSelectedIndex,
  });

  @override
  State<SegmentControl> createState() => SegmentControlState();
}

class SegmentControlState extends State<SegmentControl> {
  LinearGradient _changeBackground(int index) {
    // setState(() {});
    return LinearGradient(
      colors: (widget.selectedIndex == index)
          ? ([buttonSegmentControl1, buttonSegmentControl2])
          : ([const Color(0xFFFFFFFF), const Color(0xFFFFFFFF)]),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  Color _changeColor(int index) {
    return Color((widget.selectedIndex == index) ? 0xFFFFFFFF : 0x33000000);
  }

  void _changeSelectedIndex(int index) {
    setState(() {
      widget.selectedIndex = index;
      widget.getSelectedIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFFBFBFB),
        border: Border.all(
          color: const Color(0xFFEDEDED),
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        boxShadow: [segmentControlBoxShadow1, segmentControlBoxShadow2],
      ),
      child: Row(children: [
        for (int i = 0; i < widget.items.length; i++)
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () => _changeSelectedIndex(i),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: _changeBackground(i),
                ),
                child: Text(
                  widget.items[i],
                  style: TextStyle(
                    color: _changeColor(i),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
      ]),
    );
  }
}
