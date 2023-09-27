// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../navigationDrawer/navigationDrawer.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = '/profilePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text("My Profile"),
        ),
        drawer: NavigationDrawer2(),
        body: const Center(child: Text("This is profile page")));
  }
}
