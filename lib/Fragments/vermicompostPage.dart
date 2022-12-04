// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../navigationDrawer/navigationDrawer.dart';

class VermicompostPage extends StatelessWidget {
  static const String routeName = '/vermicompostPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Vermicompost"),
        ),
        drawer: NavigationDrawer(),
        body: const Center(child: Text("This is vermicompost page")));
  }
}
