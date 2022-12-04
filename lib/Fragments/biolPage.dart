// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../navigationDrawer/navigationDrawer.dart';

class BiolPage extends StatelessWidget {
  static const String routeName = '/biolPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Biol"),
        ),
        drawer: NavigationDrawer(),
        body: const Center(child: Text("This is biol page")));
  }
}
