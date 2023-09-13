import 'dart:ui';

import 'package:flutter/material.dart';

const Color greenDark = Color(0xFF1A7D5A);
const Color greenLight = Color(0xFFF0FDE1);
const Color redDark = Color(0xFFA31616);
const Color whiteText = Color(0xFFFFFFFF);
const Color darkText = Color(0xFF1A1927);
Color darkText50 = const Color(0xFF1A1927).withOpacity(0.5);
const Color buildingName1 = Color(0xA4E65C00);
const Color buildingName2 = Color(0xA4F9D423);
const Color blueLight = Color(0xFFB2DDFF);
const Color bodyBgContainer = Color(0xFFFFF9E8);
const Color cardRoomBg = Color(0xFFF9F9F9);
const Color cardBg = Color(0xFFF9F9F9);
const Color deviceBg = Color(0xFFF9F9F9);
const Color numberDevicesCl = Color(0xFF979797);
const Color switchOnOffBg1 = Color(0xFFC9CED7);
const Color switchOnOffBg2 = Color(0xFFE1E8F1);
const Color switchOnBg1 = greenDark;
const Color switchOnBg2 = greenLight;
const Color switchOffBg1 = Color(0xFFA31616);
const Color switchOffBg2 = Color(0xFFFDE1E1);
const Color buttonSegmentControl1 = Color(0xFF29B583);
const Color buttonSegmentControl2 = greenDark;
const Color grayBackground = Color.fromRGBO(0, 0, 0, .03);
Color appBarColor= greenDark.withOpacity(0.25);


BoxShadow customBoxShadow = BoxShadow(
  color: const Color(0xFF3B4D56).withOpacity(0.16),
  blurRadius: 6,
  offset: const Offset(2, 2),
);

BoxShadow segmentControlBoxShadow1 = BoxShadow(
  color: const Color(0xFF000000).withOpacity(0.25),
  blurRadius: 2,
  offset: const Offset(0, 1),
  blurStyle: BlurStyle.normal,
);

BoxShadow segmentControlBoxShadow2 = BoxShadow(
  color: const Color(0xFF41455D).withOpacity(0.25),
  blurRadius: 6,
  offset: const Offset(0, 2),
  blurStyle: BlurStyle.inner,
);
