// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../navigationDrawer/navigationDrawer.dart';
import '../widgets/createPageContent.dart';

class VermicompostPage extends StatelessWidget {
  static const String routeName = '/vermicompostPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vermicompost"),
      ),
      drawer: NavigationDrawer(),
      body: createPageContent(
          'https://lfcali.edu.co/images/vermicompost.jpg',
          ' VERMICOMPOST',
          'Técnica que consiste en un proceso de bio‐oxidación y estabilización de la materia orgánica, mediado por la acción combinada de lombrices de tierra y microorganismos, del que se obtiene un producto final estabilizado, homogéneo y de granulometría fina denominado vermicompost o humus de lombriz, muy apreciado en el mercado.'),
    );
  }
}
