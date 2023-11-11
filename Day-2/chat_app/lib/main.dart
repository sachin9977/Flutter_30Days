// import 'package:chat_app/screens/auth/login_screen.dart';
// import 'package:chat_app/screens/home_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/services.dart';
// import 'firebase_options.dart';

// // for accessing device size
// late Size mq;
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations(
//           [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
//       .then((value) => Firebase.initializeApp(
//             options: DefaultFirebaseOptions.currentPlatform,
//           ));
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'BaatChit',
// theme: ThemeData(
//   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//   // useMaterial3: true,
// ),
//       home: FirebaseAuth.instance.currentUser != null
//           ? HomeScreen()
//           : LoginScreen(),
//     );
//   }
// }

import 'dart:developer';

import 'package:chat_app/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//global object for accessing device screen size
late Size mq;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //enter full-screen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  //for setting orientation to portrait only
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) {
    _initializeFirebase();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'We Chat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
        ),
        home: LoginScreen());
  }
}

_initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // var result = await FlutterNotificationChannel.registerNotificationChannel(
  //     description: 'For Showing Message Notification',
  //     id: 'chats',
  //     importance: NotificationImportance.IMPORTANCE_HIGH,
  //     name: 'Chats');
  log('nNotification Channel Result:');
}
