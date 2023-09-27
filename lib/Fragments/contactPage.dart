// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../navigationDrawer/navigationDrawer.dart';

class ContactPage extends StatelessWidget {
  static const String routeName = '/contactPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text("Contacts"),
        ),
        drawer: NavigationDrawer2(),
        body: const Center(child: Text("This is contacts page")));
  }
}
