import 'package:app_startup/constants/color_app.dart';
import 'package:app_startup/services/notifi_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:intl/intl.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';

// class BottomNav extends StatefulWidget {
//   final int selectedIndex;
//   final ValueChanged<int> changeSelectedIndex;

//   const BottomNav({super.key,
//     required this.selectedIndex,
//     required this.changeSelectedIndex,
//   });

//   @override
//   State<BottomNav> createState() => BottomNavState();
// }

// class BottomNavState extends State<BottomNav> {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       // selectedFontSize: 14,
//       selectedIconTheme: const IconThemeData(color: greenDark, size: 30),
//       selectedItemColor: greenDark,
//       // selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
//       type: BottomNavigationBarType.fixed,
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home_outlined),
//           label: 'Home',
//         ),
//         // BottomNavigationBarItem(
//         //   icon: Icon(Icons.settings_outlined),
//         //   label: 'Setting',
//         // ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.notifications_outlined),
//           label: 'Notification',
//         ),
//         // BottomNavigationBarItem(
//         //   icon: Icon(Icons.dashboard_outlined),
//         //   label: 'Manager',
//         // ),
//       ],
//       currentIndex: widget.selectedIndex,
//       onTap: widget.changeSelectedIndex,
//     );
//   }
// }

class BottomNav extends StatefulWidget {
  final ValueChanged<int> changePageIndex;

  const BottomNav({super.key, required this.changePageIndex});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.zero,
      height: 70,
      color: Colors.white,
      shape: const CircularNotchedRectangle(), //shape of notch
      notchMargin: 10, //notche margin between floating button and bottom appbar
      child: Row(
        //children inside bottom appbar
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.home_outlined,
                  color: greenDark,
                  size: 30,
                ),
                onPressed: () {
                  widget.changePageIndex(0);
                },
              ),
              const Text('Home', style: TextStyle(fontSize: 12))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: greenDark,
                  size: 30,
                ),
                onPressed: () {
                  widget.changePageIndex(1);
                },
              ),
              const Text('Notification', style: TextStyle(fontSize: 12))
            ],
          ),
        ],
      ),
    );
  }
}

class FloatingMicButton extends StatefulWidget {
  const FloatingMicButton({super.key});

  @override
  State<FloatingMicButton> createState() => _FloatingMicButtonState();
}

class _FloatingMicButtonState extends State<FloatingMicButton> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _speechEnabled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init');
    initSpeech();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: greenDark,
      foregroundColor: Colors.white,
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (context) => BottomSheetOfMicButton(
            speech: _speech,
            speechEnabled: _speechEnabled,
          ),
        );
      },
      child: const Icon(Icons.mic_none),
    );
  }

  void initSpeech() async {
    _speechEnabled = await _speech.initialize(
      onStatus: (val) async {
        print('onStatus: $val');
        setState(() {});
        if (_speech.isListening) {
          print('is listening 1');
        } else if (_speech.isNotListening) {
          print('is not listening 1');
        }
        // setState(() {
        //   if (_speech.isNotListening && _confidence > 0) {
        //     Navigator.pop(context);
        //     // _speech.stop();
        //   }
        // });

        // if (!mounted) {
        //   return;
        // }
        // if (val == 'done') {
        //   print('done');
        //   print(_isListening);
        //   // if (!mounted) {return;}
        //   print(mounted);
        //   // if (mounted) {
        //   //   _isListening = false;
        //   //   await _speech.stop();
        //   //   print('stop');
        //   //   Navigator.pop(context);
        //   //   // setState(() {});
        //   // }
        // }
      },
    );
    setState(() {});
  }
}

class BottomSheetOfMicButton extends StatefulWidget {
  stt.SpeechToText speech;
  bool speechEnabled;
  BottomSheetOfMicButton(
      {super.key, required this.speech, required this.speechEnabled});

  @override
  State<BottomSheetOfMicButton> createState() => _BottomSheetOfMicButtonState();
}

class _BottomSheetOfMicButtonState extends State<BottomSheetOfMicButton> {
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  // String _wordSpoken = 'Đang lắng nghe ...';
  String _wordSpoken = 'Listening ...';
  double _confidence = 0.0;
  bool isListened = false;
  bool _speechEnabled = false;

  @override
  void initState() {
    if (widget.speech.isAvailable) {
      print('isAvailable');
    } else {
      print('isNotAvailable');
    }
    setState(() {});
    // _startListening();
    widget.speech.listen(
      onResult: _onSpeechResult,
      listenFor: const Duration(seconds: 5),
    );
    print('setState start');
    if (widget.speech.isListening) {
      print('is listening');
    } else if (widget.speech.isNotListening) {
      print('is not listening');
    }
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   print('init');
  //   initSpeech();
  //   // _startListening();
  //   // _speech = stt.SpeechToText();
  //   // _listen();
  //   // if (!mounted) return;

  //   // Future.delayed(Duration.zero, () async {
  //   //   _listen(context);
  //   // });
  // }

  // @override
  // void dispose() async {
  //   super.dispose();
  //   print('disposing');
  //   await _speech.stop();
  // }

  @override
  Widget build(BuildContext context) {
    print('mounted: ${mounted}');
    if (!isListened) {
      isListened = true;
      // _listen(context);
    }
    return Container(
      height: 200,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Text(widget.speech.isListening
            //     ? "listening..."
            //     : _speechEnabled
            //         ? 'Tap the microphone to start listening...'
            //         : 'Speech is not available'),
            Text(_wordSpoken),
            // ElevatedButton(
            //   child: const Text('Close BottomSheet'),
            //   onPressed: () => Navigator.pop(context),
            // ),
            AvatarGlow(
              animate: widget.speechEnabled,
              glowColor: greenDark,
              endRadius: 75.0,
              duration: const Duration(milliseconds: 2000),
              repeatPauseDuration: const Duration(milliseconds: 100),
              repeat: true,
              child: FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: greenDark,
                foregroundColor: Colors.white,
                onPressed: () {
                  // if (!mounted) {
                  //   return;
                  // }
                  // setState(() {
                  //   _isListening = false;
                  //   // _speech.stop();
                  // });
                  // if (mounted) {
                  if (mounted) {
                    widget.speech.stop();
                  }
                  Navigator.of(context).pop();
                  DatabaseReference _isOnRef;
                  String isOnPath = 'Flutter/Monitor1/isOn';
                  switch (_wordSpoken) {
                    case 'bật hệ thống':
                    case 'turn on':
                      FirebaseDatabase.instance.ref().child(isOnPath).set(1);
                      break;
                    case 'tắt hệ thống':
                    case 'turn off':
                      FirebaseDatabase.instance.ref().child(isOnPath).set(0);
                      break;
                  }

                  // }
                },
                child: const Icon(Icons.mic),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _listen(BuildContext context) async {
  //   print('_isListening: $_isListening');
  //   if (!_isListening) {
  //     bool available = await _speech.initialize(
  //       onStatus: (val) async {
  //         print('onStatus: $val');
  //         // if (!mounted) {
  //         //   return;
  //         // }
  //         if (val == 'done') {
  //           print('done');
  //           print(_isListening);
  //           // if (!mounted) {return;}
  //           print(mounted);
  //           // if (mounted) {
  //           //   _isListening = false;
  //           //   await _speech.stop();
  //           //   print('stop');
  //           //   Navigator.pop(context);
  //           //   // setState(() {});
  //           // }
  //         }
  //       },
  //       onError: (val) => print('onError: $val'),
  //     );
  //     print('onAvailable: $available');
  //     if (available) {
  //       setState(() {
  //         _isListening = true;
  //         print('_isListening2: $_isListening');
  //       });
  //       await _speech.listen(
  //         onResult: (val) {
  //           if (mounted) {
  //             setState(() {
  //               _text = val.recognizedWords;
  //               if (val.hasConfidenceRating && val.confidence > 0) {
  //                 _confidence = val.confidence;
  //               }
  //               // _speech.stop();
  //               FirebaseDatabase.instance.ref().child('TestMic').set(_text);
  //             });
  //           }
  //         },
  //         listenFor: const Duration(seconds: 5),
  //       );
  //       print('stop after listen');
  //       Navigator.pop(context);
  //     }
  //   }
  //   // else {
  //   //   // setState(() {
  //   //     _isListening = false;
  //   //     _speech.stop();
  //   //     print(_isListening);
  //   //     print('Pop');
  //   //     Navigator.pop(context);
  //   //   // });
  //   // }
  // }

  // void initSpeech() async {
  //   _speechEnabled = await _speech.initialize(
  //     onStatus: (val) async {
  //       print('onStatus: $val');
  //       setState(() {
  //         if (_speech.isNotListening && _confidence > 0) {
  //           Navigator.pop(context);
  //           // _speech.stop();
  //         }
  //       });

  //       // if (!mounted) {
  //       //   return;
  //       // }
  //       // if (val == 'done') {
  //       //   print('done');
  //       //   print(_isListening);
  //       //   // if (!mounted) {return;}
  //       //   print(mounted);
  //       //   // if (mounted) {
  //       //   //   _isListening = false;
  //       //   //   await _speech.stop();
  //       //   //   print('stop');
  //       //   //   Navigator.pop(context);
  //       //   //   // setState(() {});
  //       //   // }
  //       // }
  //     },
  //   );
  //   setState(() {});
  //   await _speech.listen(
  //     onResult: _onSpeechResult,
  //     listenFor: const Duration(seconds: 5),
  //   );
  // }

  void _startListening() async {
    setState(() {});
    await widget.speech.listen(
      onResult: _onSpeechResult,
      listenFor: const Duration(seconds: 5),
    );
    setState(() {});

    // if (widget.speech.isNotListening && _confidence > 0) {
    //   _stopListening();
    //   print('stop');
    // }
  }

  void _onSpeechResult(result) {
    if (mounted) {
      setState(() {
        _wordSpoken = '${result.recognizedWords}';
        _confidence = result.confidence;
      });
    }
  }

  void _stopListening() async {
    await widget.speech.stop();
    Navigator.pop(context);
  }
}
