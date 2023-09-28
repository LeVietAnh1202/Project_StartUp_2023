import 'package:app_startup/components/firebase_api/firebase_api.dart';
import 'package:app_startup/login_signup/login_form.dart';
import 'package:app_startup/screen/main_screen.dart';
import 'package:app_startup/screen/push_notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:url_strategy/url_strategy.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(); 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseApi().initNotifications();
  // FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
  //   // TODO: If necessary send token to application server.

  //   // Note: This callback is fired at each app startup and whenever a new
  //   // token is generated.
  //   print(fcmToken);
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
        '/':(context) => const MainScreen(),
        '/push-page': ((context) => const PushNotification()),
      },
    );
  }
}
