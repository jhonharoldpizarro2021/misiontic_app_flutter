// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:misiontic_app_1/routes/pageRoute.dart';
import '../navigationDrawer/navigationDrawer.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/homePage';

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      // signed out
      Navigator.pushReplacementNamed(context, PageRoutes.login);
    }
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: NavigationDrawer2(),
        body: const Center(child: Text("This is home page")));
  }
}
