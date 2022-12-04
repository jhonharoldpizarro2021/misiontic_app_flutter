// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
//import 'home.dart';
import 'Fragments/homePage.dart';
import 'Fragments/contactPage.dart';
import 'Fragments/profilePage.dart';
import 'Fragments/notificationPage.dart';
import 'Fragments/abonosPage.dart';
import 'Fragments/compostPage.dart';
import 'Fragments/vermicompostPage.dart';
import 'Fragments/turbaPage.dart';
import 'Fragments/enmiendaPage.dart';
import 'Fragments/cenizaPage.dart';
import 'Fragments/biolPage.dart';
import 'Fragments/BiofertilizantesPage.dart';
import 'Fragments/biosolidosPage.dart';
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
        PageRoutes.abonos: (context) => AbonosPage(),
        PageRoutes.profile: (context) => ProfilePage(),
        PageRoutes.notification: (context) => NotificationPage(),
        PageRoutes.compost: (context) => CompostPage(),
        PageRoutes.vermicompost: (context) => VermicompostPage(),
        PageRoutes.turba: (context) => TurbaPage(),
        PageRoutes.enmienda: (context) => EnmiendaPage(),
        PageRoutes.ceniza: (context) => CenizaPage(),
        PageRoutes.biol: (context) => BiolPage(),
        PageRoutes.biofertilizantes: (context) => BiofertilizantesPage(),
        PageRoutes.biosolidos: (context) => BiosolidosPage(),
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
