// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

Widget createDrawerHeader() {
  return const DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('lib/images/logo_App.jpg'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Desarrollo para el Campo",
                style: TextStyle(
                    //color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]));
}
