// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../navigationDrawer/navigationDrawer.dart';
import '../routes/pageRoute.dart';
import '../widgets/createPageContent.dart';

class BiosolidosPage extends StatelessWidget {
  static const String routeName = '/biosolidosPage';

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
                child: const Text('Biosolidos')),
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
          'https://lfcali.edu.co/images/biosolido.jpg',
          'BIO SOLIDOS COMPUESTOS DE AGUAS NEGRAS',
          'Son imprescindibles para la agricultura ecológica, ya que ayudan a mejorar la producción agrícola y a conseguir grandes cosechas sin dañar en ningún momento el medio ambiente y siguiendo directrices totalmente respetuosas con el suelo, la naturaleza y el desarrollo sostenible.'),
    );
  }
}
