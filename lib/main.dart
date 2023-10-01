// ignore_for_file: use_key_in_widget_constructors
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:misiontic_app_1/Fragments/ubicacionesPage.dart';
import 'domain/geo_controller.dart';
//import 'home.dart';
import 'Fragments/loginPage.dart';
import 'Fragments/registroPage.dart';
import 'Fragments/homePage.dart';
import 'Fragments/contactPage.dart';
import 'Fragments/profilePage.dart';
import 'Fragments/notificationPage.dart';
import 'Fragments/productsPage.dart';
import 'Fragments/compostPage.dart';
import 'Fragments/vermicompostPage.dart';
import 'Fragments/turbaPage.dart';
import 'Fragments/enmiendaPage.dart';
import 'Fragments/cenizaPage.dart';
import 'Fragments/biolPage.dart';
import 'Fragments/BiofertilizantesPage.dart';
import 'Fragments/biosolidosPage.dart';
import 'domain/people_controller.dart';
import 'routes/pageRoute.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Loggy.initLoggy(
      logPrinter: const PrettyPrinter(
    showColors: true,
  ));
  await Firebase.initializeApp();
  runApp(MyApp());
}

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static const Color white = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    Get.put(GeoController());
    Get.put(PeopleController());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NavigationDrawer Demo',
      theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          appBarTheme: const AppBarTheme(
            color: Color(0xFFFFFFFF),
          )),
      home: LoginPage(),
      routes: {
        PageRoutes.login: (context) => LoginPage(),
        PageRoutes.registro: (context) => RegistroPage(),
        PageRoutes.home: (context) => HomePage(),
        PageRoutes.contact: (context) => ContactPage(),
        PageRoutes.productos: (context) => ProductsPage(),
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
        PageRoutes.ubicaciones: (context) => UbicacionesPage()
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
