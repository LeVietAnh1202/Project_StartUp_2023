import 'package:app_startup/components/firebase_api/firebase_api.dart';
import 'package:app_startup/login_signup/login_form.dart';
import 'package:app_startup/screen/main_screen.dart';
import 'package:app_startup/screen/push_notification.dart';
import 'package:app_startup/services/notifi_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'firebase_options.dart';
import 'package:url_strategy/url_strategy.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseApi().initNotifications();
  // FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
  //   // TODO: If necessary send token to application server.

  //   // Note: This callback is fired at each app startup and whenever a new
  //   // token is generated.
  //   print("Token" + fcmToken);
  // }).onError((err) {
  //   // Error getting token.
  // });

  FirebaseApi firebaseApi = FirebaseApi();
  firebaseApi.onMessageOpenedApp();
  firebaseApi.getInitialMessage();
  // firebaseApi.onBackgroundMessage();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
    const MyApp(),
  );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  print("_firebaseMessagingBackgroundHandlers: $message");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseDatabase.instance
        .ref()
        .child('ESP8266/Monitor1/Warning')
        .onValue
        .listen((event) {
      if (event.snapshot.value != null) {
        print(event.snapshot.value);
        if (event.snapshot.value as num == 1) {
          print('have warning');
          DateTime now = DateTime.now();
          String formattedDate = DateFormat('dd/MM/yyyy').format(now);
          String formattedTime = DateFormat('HH:mm:ss').format(now);
          NotificationService().showNotification(
              title: 'Cảnh báo', body: 'Hệ thống quá tải lúc $formattedDate $formattedTime');
        }
      }
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // toggleableActiveColor: Colors.blue,
        // unselectedWidgetColor: Colors.grey,
      ),
      // home: const MainScreen(),
      navigatorKey: navigatorKey,
      routes: {
        '/': (context) => const MainScreen(),
        '/push-page': ((context) => const PushNotification()),
      },
    );
  }
}
