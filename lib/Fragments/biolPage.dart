// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../navigationDrawer/navigationDrawer.dart';
import '../widgets/createPageContent.dart';

class BiolPage extends StatelessWidget {
  static const String routeName = '/biolPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biol"),
      ),
      drawer: NavigationDrawer(),
      body: createPageContent('https://lfcali.edu.co/images/biol.jpg', 'BIOL',
          'El Biol es un excelente abono foliar. El Biol sirve para que las plantas estén verdes y den buenos frutos como papa, maíz, trigo, haba, hortalizas y frutales. El Biol se prepara con diferentes huanos que tiene que fermentar durante dos a tres meses en un bidón de plástico.'),
    );
  }
}
