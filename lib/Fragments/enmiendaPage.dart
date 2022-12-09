// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../navigationDrawer/navigationDrawer.dart';
import '../routes/pageRoute.dart';
import '../widgets/createPageContent.dart';

class EnmiendaPage extends StatelessWidget {
  static const String routeName = '/enmiendaPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: const Text('Enmienda Organica')),
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
      drawer: NavigationDrawer(),
      body: createPageContent(
          'https://lfcali.edu.co/images/enmienda.jpg',
          'ENMIENDA ORGANICA',
          'La turba es un material orgánico, de color pardo oscuro y rico en carbono.​​ Está formada por una masa esponjosa y ligera en la que aún se aprecian los componentes vegetales que la originaron. Se emplea como combustible y en la obtención de abonos orgánicos. La turba es un producto mineral.'),
    );
  }
}
