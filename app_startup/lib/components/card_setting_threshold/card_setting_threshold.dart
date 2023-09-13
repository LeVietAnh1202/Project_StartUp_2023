import 'package:app_startup/constants/string_app.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:app_startup/components/customSwitch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:app_startup/constants/color_app.dart';

// ignore: must_be_immutable
class CartSettingThreshold extends StatefulWidget {
  String thresholdText, notiText;
  CartSettingThreshold({
    super.key,
    required this.thresholdText,
    required this.notiText,
  });

  @override
  _CartSettingThresholdState createState() => _CartSettingThresholdState();
}

class _CartSettingThresholdState extends State<CartSettingThreshold> {
  late DatabaseReference _thresholdRef, _notiRef;
  // var _thresholdRef = FirebaseDatabase.instance.reference().child(voltageThresholdPath);
  double voltageThreshold = 100.0; // Giá trị mức điện áp muốn cảnh báo
  double _voltage = 0.0;
  bool _isNoti = false; // Biến để bật hoặc tắt thông báo cảnh báo

  TextEditingController voltageController = TextEditingController();
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    String thresholdPath, notiPath;
    switch (widget.thresholdText) {
      case voltageThresholdText:
        {
          thresholdPath = voltageThresholdPath;
          notiPath = voltageNotiPath;
          break;
        }
      case amperageThresholdText:
        {
          thresholdPath = amperageThresholdPath;
          notiPath = amperageNotiPath;
          break;
        }
      default:
        {
          thresholdPath = '';
          notiPath = '';
        }
    }

    setState(() {
      _thresholdRef =
          FirebaseDatabase.instance.reference().child(thresholdPath);
      _notiRef = FirebaseDatabase.instance.reference().child(notiPath);
    });

    _thresholdRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          _voltage = (event.snapshot.value as num).toDouble();
          voltageController.text = _voltage.toString();
        });
      }
    });
    
    _notiRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          _isNoti = event.snapshot.value as bool;
        });
      }
    });
  }

  void toggleEdit() {
    setState(() {
      if (isEditing) {
        // Lưu giá trị mới và chuyển sang chế độ xem
        _voltage = double.parse(voltageController.text);
        // voltageThreshold = double.parse(voltageController.text);
        _thresholdRef.set(_voltage); // Cập nhật giá trị lên Firebase
      }
      isEditing = !isEditing;
    });
  }

  void toggleNoti(bool isNoti) {
        _notiRef.set(isNoti); // Cập nhật giá trị lên Firebase
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardRoomBg,
      elevation: 4.0,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  // 'Mức điện áp muốn cảnh báo:',
                  widget.thresholdText,
                  style: const TextStyle(fontSize: 18.0),
                ),
                trailing: isEditing
                    ? IconButton(
                        icon: const Icon(Icons.done),
                        onPressed: toggleEdit,
                      )
                    : IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: toggleEdit,
                      ),
              ),
              isEditing
                  ? Container(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        autofocus: true,
                        controller: voltageController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                        decoration: const InputDecoration(
                          // suffix: Row(
                          //   mainAxisSize: MainAxisSize.min,
                          //   children: [
                          //     Text(' V'), // Chữ "V" đứng ngay sau số
                          //   ],
                          // ),
                          contentPadding: EdgeInsets.fromLTRB(0, 3, 0, 12),
                          isDense:
                              true, // Đặt isDense thành true để sát với nội dung
                          // Để thêm đường gạch dưới, sử dụng border:
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Colors.blue), // Màu sắc của đường gạch dưới
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .blue), // Màu sắc của đường gạch dưới khi có focus
                          ),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Text(
                          // '$voltageThreshold V',
                          '$_voltage V',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        const Divider(),
                      ],
                    ),
              // SwitchListTile(
              //   title: Text(
              //     'Thông Báo Quá Điện Áp:',
              //     style: TextStyle(fontSize: 18.0),
              //   ),
              //   value: _isNoti,
              //   onChanged: (value) {
              //     setState(() {
              //       _isNoti = value;
              //     });
              //   },
              // ),
              ListTile(
                title: Text(
                  widget.notiText,
                  style: const TextStyle(fontSize: 18.0),
                ),
                trailing: CustomSwitch(
                  isOn: _isNoti,
                  changeStateOnOff: toggleNoti,
                ),
                // trailing: Switch(
                //   value: _isNoti,
                //   onChanged: (value) {
                //     setState(() {
                //       _isNoti = value;
                //     });
                //   },
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    voltageController.dispose();
    super.dispose();
  }
}
