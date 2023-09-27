// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../navigationDrawer/navigationDrawer.dart';
import '../routes/pageRoute.dart';
import '../widgets/createPageContent.dart';

class VermicompostPage extends StatelessWidget {
  static const String routeName = '/vermicompostPage';

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
                child: const Text('Vermicompost')),
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
          'https://lfcali.edu.co/images/vermicompost.jpg',
          ' VERMICOMPOST',
          'Técnica que consiste en un proceso de bio‐oxidación y estabilización de la materia orgánica, mediado por la acción combinada de lombrices de tierra y microorganismos, del que se obtiene un producto final estabilizado, homogéneo y de granulometría fina denominado vermicompost o humus de lombriz, muy apreciado en el mercado.'),
    );
  }
}
