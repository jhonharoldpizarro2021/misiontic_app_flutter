// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../navigationDrawer/navigationDrawer.dart';
import '../routes/pageRoute.dart';
import '../widgets/createPageContent.dart';

class CenizaPage extends StatelessWidget {
  static const String routeName = '/cenizaPage';

  @override
  Widget build(BuildContext context) {
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
                child: const Text('Ceniza')),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Regresar',
            onPressed: () {
              Navigator.pushReplacementNamed(context, PageRoutes.productos);
            },
          ),
        ],
      ),
      drawer: NavigationDrawer2(),
      body: createPageContent(
          'https://lfcali.edu.co/images/cenizas.jpg',
          'CENIZA',
          'La ceniza es uno de los fertilizantes o abonos naturales más conocidos a la hora de dar un extra de nutrientes a los sustratos y suelos en el hogar, sobre todo, en aquellas viviendas donde se dispone de una estufa o lumbre de leña en invierno, donde los restos pueden ser empleados posteriormente a las plantas del huerto o jardín.'),
    );
  }
}
