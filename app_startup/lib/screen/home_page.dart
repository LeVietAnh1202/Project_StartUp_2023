import 'package:app_startup/components/card_room/card_room.dart';
import 'package:app_startup/components/segment_control/segment_control.dart';
import 'package:flutter/material.dart';

import 'package:app_startup/constants/color_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;

    // double baseWidth = 443;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;

    List<CardRoom> cardRooms = [
      CardRoom(
        isOn: true,
        roomName: 'Living room 1',
        number: 5,
        image: 'assets/images/living-room-1.png',
      ),
      CardRoom(
        isOn: false,
        roomName: 'Bed room 1',
        number: 2,
        image: 'assets/images/bed-room-1.jfif',
      ),
      CardRoom(
        isOn: true,
        roomName: 'Kitchen room',
        number: 6,
        image: 'assets/images/kitchen.jfif',
      ),
      CardRoom(
        isOn: false,
        roomName: 'Bed room 2',
        number: 5,
        image: 'assets/images/bed-room-2.jfif',
      ),
      CardRoom(
        isOn: true,
        roomName: 'Bed room 3',
        number: 5,
        image: 'assets/images/bed-room-3.jfif',
      ),
      CardRoom(
        isOn: false,
        roomName: 'Living room 2',
        number: 5,
        image: 'assets/images/living-room-2.jfif',
      ),
    ];

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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
              selectedIndex: 0,
              items: const ['Room', 'Devices'],
            ),

            Container(height: 20),
            // Container card rooms
            Flexible(
              flex: 12,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: bodyBgContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Expanded(
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(scrollbars: false),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: Column(children: cardRoomsWidget),
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
