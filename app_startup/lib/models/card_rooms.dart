import 'package:app_startup/components/card_room/card_room.dart';

class CardRoomsModel {
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

  List<CardRoom> get getCardRooms => cardRooms;
}
