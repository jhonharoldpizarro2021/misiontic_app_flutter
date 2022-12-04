// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../navigationDrawer/navigationDrawer.dart';

class CompostPage extends StatelessWidget {
  static const String routeName = '/compostPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Compost"),
        ),
        drawer: NavigationDrawer(),
        body: const Center(child: Text("This is compost page")));
  }
}
