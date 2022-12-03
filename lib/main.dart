// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
//import 'home.dart';
import 'Fragments/homePage.dart';
import 'Fragments/contactPage.dart';
import 'Fragments/eventPage.dart';
import 'Fragments/profilePage.dart';
import 'Fragments/notificationPage.dart';
import 'routes/pageRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NavigationDrawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        PageRoutes.home: (context) => HomePage(),
        PageRoutes.contact: (context) => ContactPage(),
        PageRoutes.event: (context) => EventPage(),
        PageRoutes.profile: (context) => ProfilePage(),
        PageRoutes.notification: (context) => NotificationPage(),
      },
    );
  }
}

/* void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desarrollo para el Campo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      //home: const MyHomePage(title: 'Desarrollo para el Campo'),
      home: Home(),
    );
  }
} */
