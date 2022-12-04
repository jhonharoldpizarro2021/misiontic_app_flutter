// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../navigationDrawer/navigationDrawer.dart';
import '../widgets/createPageContent.dart';

class EnmiendaPage extends StatelessWidget {
  static const String routeName = '/enmiendaPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enmienda Organica"),
      ),
      drawer: NavigationDrawer(),
      body: createPageContent(
          'https://lfcali.edu.co/images/enmienda.jpg',
          'ENMIENDA ORGANICA',
          'La turba es un material orgánico, de color pardo oscuro y rico en carbono.​​ Está formada por una masa esponjosa y ligera en la que aún se aprecian los componentes vegetales que la originaron. Se emplea como combustible y en la obtención de abonos orgánicos. La turba es un producto mineral.'),
    );
  }
}
