// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, no_leading_underscores_for_local_identifiers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../domain/producto_controller.dart';
import '../widgets/listProducts.dart';

import '../navigationDrawer/navigationDrawer.dart';
import '../routes/pageRoute.dart';
//import '../widgets/createAppBar.dart';

class AbonosPage extends StatefulWidget {
  static const String routeName = '/abonosPage';
  @override
  _AbonosPageState createState() => _AbonosPageState();
}

class _AbonosPageState extends State<AbonosPage> {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      // signed out
      Navigator.pushReplacementNamed(context, PageRoutes.login);
    }
    Get.put(ProductoController());
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
                padding: const EdgeInsets.all(8.0),
                child: const Text('Productos')),
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
      body: const ProductosWidget(),
    );
  }
}
