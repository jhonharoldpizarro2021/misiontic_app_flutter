// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../navigationDrawer/navigationDrawer.dart';
import '../routes/pageRoute.dart';
import '../widgets/createPageContent.dart';

class CompostPage extends StatelessWidget {
  static const String routeName = '/compostPage';

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
                child: const Text('Compost')),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Regresar',
            onPressed: () {
              Navigator.pushReplacementNamed(context, PageRoutes.abonos);
            },
          ),
        ],
      ),
      drawer: NavigationDrawer2(),
      body: createPageContent(
          'https://lfcali.edu.co/images/compost.jpg',
          'COMPOST',
          'El compost con materia orgánica, resultado de un proceso biológico cuyo fin es estabilizar e higienizar los residuos orgánicos, es un magnífico fertilizante. Aunque sus usos y beneficios van más allá: reactiva suelos contaminados o degradados, ayuda a reciclar residuos sólidos urbanos, controla las plagas… El compostaje es parte de nuestro sustrato vital.'),
    );
  }
}
