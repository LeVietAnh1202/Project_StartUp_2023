import 'package:app_startup/components/card_room/card_room.dart';
import 'package:app_startup/components/segment_control/segment_control.dart';
import 'package:app_startup/constants/string_app.dart';
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
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
                            ),
                            Container(
                              height: 5,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                color: blueLight,
                                height: 32,
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
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 0, 0),
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
                              'assets/images/living-room.png',
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: bodyBgContainer,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Expanded(
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.all(7),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: CardRoom(
                                      isOn: true,
                                      roomName: 'Living room',
                                      number: 5,
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: CardRoom(
                                        isOn: false,
                                        roomName: 'Living room',
                                        number: 5),
                                  ),
                                ],
                              ),
                              Container(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: CardRoom(
                                      isOn: true,
                                      roomName: 'Living room',
                                      number: 5,
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: CardRoom(
                                        isOn: false,
                                        roomName: 'Living room',
                                        number: 5),
                                  ),
                                ],
                              ),
                              Container(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: CardRoom(
                                      isOn: true,
                                      roomName: 'Living room',
                                      number: 5,
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: CardRoom(
                                        isOn: false,
                                        roomName: 'Living room',
                                        number: 5),
                                  ),
                                ],
                              ),
                            ]),
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
