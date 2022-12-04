// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../navigationDrawer/navigationDrawer.dart';
import '../widgets/createPageContent.dart';

class CenizaPage extends StatelessWidget {
  static const String routeName = '/cenizaPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ceniza"),
      ),
      drawer: NavigationDrawer(),
      body: createPageContent(
          'https://lfcali.edu.co/images/cenizas.jpg',
          'CENIZA',
          'La ceniza es uno de los fertilizantes o abonos naturales más conocidos a la hora de dar un extra de nutrientes a los sustratos y suelos en el hogar, sobre todo, en aquellas viviendas donde se dispone de una estufa o lumbre de leña en invierno, donde los restos pueden ser empleados posteriormente a las plantas del huerto o jardín.'),
    );
  }
}
