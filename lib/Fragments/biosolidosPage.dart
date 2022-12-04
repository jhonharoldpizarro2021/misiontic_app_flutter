// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../navigationDrawer/navigationDrawer.dart';
import '../widgets/createPageContent.dart';

class BiosolidosPage extends StatelessWidget {
  static const String routeName = '/biosolidosPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biosolidos"),
      ),
      drawer: NavigationDrawer(),
      body: createPageContent(
          'https://lfcali.edu.co/images/biosolido.jpg',
          'BIO SOLIDOS COMPUESTOS DE AGUAS NEGRAS',
          'Son imprescindibles para la agricultura ecológica, ya que ayudan a mejorar la producción agrícola y a conseguir grandes cosechas sin dañar en ningún momento el medio ambiente y siguiendo directrices totalmente respetuosas con el suelo, la naturaleza y el desarrollo sostenible.'),
    );
  }
}
