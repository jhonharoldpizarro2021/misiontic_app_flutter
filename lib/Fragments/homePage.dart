// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../domain/geo_controller.dart';
import '../domain/people_controller.dart';
import '../routes/pageRoute.dart';
import '../navigationDrawer/navigationDrawer.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/homePage';

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      // signed out
      Navigator.pushReplacementNamed(context, PageRoutes.login);
    }
    PeopleController plpCtrl = Get.find();
    GeoController geoCtrl = Get.find();

    int inn = 0;
    var items = <String>[
      'Compost',
      'Vermicompost',
      'Turba',
      'Enmienda Organica',
      'Cenizas',
      'Biol',
      'Biofertilizantes',
      'Bio Solidos'
    ];
    int innf = 0;
    var imgs = <String>[
      'lib/images/compost.jpg',
      'lib/images/vermicompost.jpg',
      'lib/images/turba.jpg',
      'lib/images/enmienda.jpg',
      'lib/images/cenizas.jpg',
      'lib/images/biol.jpg',
      'lib/images/biofertilizantes.jpg',
      'lib/images/biosolido.jpg'
    ];
    int innE = 0;
    var enlaces = [
      PageRoutes.compost,
      PageRoutes.vermicompost,
      PageRoutes.turba,
      PageRoutes.enmienda,
      PageRoutes.ceniza,
      PageRoutes.biol,
      PageRoutes.biofertilizantes,
      PageRoutes.biosolidos
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'lib/images/logo_App.jpg',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: const Text('Home')),
          ],
        ),
        /* actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Regresar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ], */
      ),
      drawer: NavigationDrawer2(),
      body: GridView.count(
        padding: const EdgeInsets.all(15),
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(items.length, (int index) {
          String names;
          if (items.isNotEmpty) {
            names = items[inn++];
          } else {
            names = '';
          }
          String fotos;
          if (imgs.isNotEmpty) {
            fotos = imgs[innf++];
          } else {
            fotos = '';
          }
          String url;
          if (enlaces.isNotEmpty) {
            url = enlaces[innE++];
          } else {
            url = '';
          }
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            margin: const EdgeInsets.all(15),
            elevation: 10,
            child: InkWell(
              onTap: () => Navigator.pushReplacementNamed(context, url),
              child: ClipRRect(
                // Los bordes del contenido del card se cortan usando BorderRadius
                borderRadius: BorderRadius.circular(0),
                // EL widget hijo que será recortado segun la propiedad anterior
                child: Column(
                  children: <Widget>[
                    // Usamos el widget Image para mostrar una imagen
                    AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Image.asset(
                        // Como queremos traer una imagen desde un url usamos NetworkImage
                        fotos,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Usamos Container para el contenedor de la descripción
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        names,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
