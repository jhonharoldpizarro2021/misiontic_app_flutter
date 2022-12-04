// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import '../navigationDrawer/navigationDrawer.dart';
import '../routes/pageRoute.dart';
import '../topBar/topBar.dart';

class AbonosPage extends StatefulWidget {
  static const String routeName = '/abonosPage';
  @override
  _AbonosPageState createState() => _AbonosPageState();
}

class _AbonosPageState extends State<AbonosPage> {
  @override
  Widget build(BuildContext context) {
    int inn = 0;
    var _items = <String>[
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
    var _imgs = <String>[
      'https://lfcali.edu.co/images/compost.jpg',
      'https://lfcali.edu.co/images/vermicompost.jpg',
      'https://lfcali.edu.co/images/turba.jpg',
      'https://lfcali.edu.co/images/enmienda.jpg',
      'https://lfcali.edu.co/images/cenizas.jpg',
      'https://lfcali.edu.co/images/biol.jpg',
      'https://lfcali.edu.co/images/biofertilizantes.jpg',
      'https://lfcali.edu.co/images/biosolido.jpg'
    ];
    int innE = 0;
    var _enlaces = [
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
      appBar: AppBar('lib/images/logo_App.jpg', 'Tipos de Abono'),
      drawer: NavigationDrawer(),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,

        // Generate 100 widgets that display their index in the List.
        children: List.generate(_items.length, (int index) {
          String names;
          if (_items.isNotEmpty) {
            names = _items[inn++];
          } else {
            names = '';
          }
          String fotos;
          if (_imgs.isNotEmpty) {
            fotos = _imgs[innf++];
          } else {
            fotos = '';
          }
          String url;
          if (_enlaces.isNotEmpty) {
            url = _enlaces[innE++];
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
                      child: Image.network(
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
