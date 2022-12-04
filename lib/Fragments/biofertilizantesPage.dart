// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../navigationDrawer/navigationDrawer.dart';
import '../widgets/createPageContent.dart';

class BiofertilizantesPage extends StatelessWidget {
  static const String routeName = '/biofertilizantesPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biofertilizantes"),
      ),
      drawer: NavigationDrawer(),
      body: createPageContent(
          'https://lfcali.edu.co/images/biofertilizantes.jpg',
          'BIOFERTILIZANTES',
          'Son imprescindibles para la agricultura ecológica, ya que ayudan a mejorar la producción agrícola y a conseguir grandes cosechas sin dañar en ningún momento el medio ambiente y siguiendo directrices totalmente respetuosas con el suelo, la naturaleza y el desarrollo sostenible.'),
    );
  }
}
