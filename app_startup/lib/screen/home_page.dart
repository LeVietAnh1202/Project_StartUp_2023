import 'package:app_startup/components/card_room/card_room.dart';
import 'package:app_startup/components/devices/monitoringUnit/monitoringUnit.dart';
import 'package:app_startup/components/segment_control/segment_control.dart';
import 'package:app_startup/models/card_rooms.dart';
import 'package:app_startup/screen/view_list_devices.dart';
import 'package:flutter/material.dart';

import 'package:app_startup/constants/color_app.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {  
  final int initialSegmentControlIndex;

  const HomePage({
    Key? key,
    this.initialSegmentControlIndex = 0,
  }) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // This widget is the root of your application.
  late int segmentControlIndex;

  @override
  void initState() {
    super.initState();
    segmentControlIndex = widget.initialSegmentControlIndex;
  }

   void _setSegmentControlIndex(int index) {
    setState(() {
      segmentControlIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;

    // double baseWidth = 443;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
 
    List<CardRoom> cardRooms = CardRoomsModel().getCardRooms;

    List<Widget> cardRoomsWidget = [];
    int rowNumber = (cardRooms.length / 2).ceil();

    for (int i = 0; i < rowNumber; i++) {
      cardRoomsWidget.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(flex: 1, child: cardRooms[i * 2]),
            Container(
              width: 2,
            ),
            if ((i * 2 + 1) < cardRooms.length)
              Flexible(flex: 1, child: cardRooms[i * 2 + 1]),
          ],
        ),
      );
      if (i < rowNumber - 1) {
        cardRoomsWidget.add(Container(
          height: 30,
        ));
      }
    }

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: appBarColor,
        title: const Text(
          "Home Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [buildingName1, buildingName2],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              height: 63,
                              child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Text(
                                          "Building name (My home)",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    // Spacer(),
                                    Icon(Icons.expand_more_outlined),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 5,
                            ),
                            Container(
                              height: 32,
                              decoration: BoxDecoration(
                                color: blueLight,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Add device",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      child: Container(
                                          height: 18,
                                          width: 18,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFF87A1E3),
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            size: 14,
                                            color: Color(0xFFFFFFFF),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(width: 5),
                      Flexible(
                          flex: 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/living-room-1.png',
                              width: double.infinity,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Container(height: 20),

            // Segment control
            SegmentControl(
              selectedIndex: segmentControlIndex,
              items: const ['Room', 'Devices'],
              getSelectedIndex: _setSegmentControlIndex,
            ),

            Container(height: 20),
            // Container card rooms
            Flexible(
              flex: 12,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: bodyBgContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Expanded(
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(scrollbars: false),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.all(7),
                          // child: Column(children: cardRoomsWidget),
                          child: Column(
                            children: segmentControlIndex == 0
                                ? cardRoomsWidget
                                : [
                                    MonitoringUnitPage(isOn: true),
                                    Container(height: 15),
                                    MonitoringUnitPage(isOn: true),
                                    Container(height: 15),
                                    MonitoringUnitPage(isOn: true),
                                    Container(height: 15),
                                    MonitoringUnitPage(isOn: true),
                                    Container(height: 15),
                                    MonitoringUnitPage(isOn: true),
                                    Container(height: 15),
                                    MonitoringUnitPage(isOn: true),
                                  ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
