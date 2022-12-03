// ignore_for_file: use_key_in_widget_constructors, annotate_overrides, unused_element

import 'package:flutter/material.dart';
import 'abonos.dart';
import 'register.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int pagina = 0;
  _navegacion(int pos) {
    switch (pos) {
      case 0:
        return Home();
      case 1:
        return Register();
      case 2:
        return Abonos();
    }
  }

  _onSelectItem(int pos) {
    setState(() {
      pagina = pos;
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Desarrollo para el Campo'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            /* UserAccountsDrawerHeader(
              accountName: Text('Desarrollo para el Campo'),
              accountEmail: Text(''),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.green,
                child:
                    Image.network("https://lfcali.edu.co/images/logo_App.jpg"),
              ),
            ), */
            Container(
              //width: 100,
              height: 50,
              margin: const EdgeInsets.all(10),
              //child: Image.network("https://lfcali.edu.co/images/logo_App.jpg"),
            ),
            const Text(
              "Desarrollo para el Campo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home),
              onTap: () {
                _onSelectItem(0);
              },
            ),
            ListTile(
              title: const Text('Registrarse'),
              leading: const Icon(Icons.supervised_user_circle),
              onTap: () {
                _onSelectItem(1);
              },
            ),
            ListTile(
              title: const Text('Tipos de Abono'),
              leading: const Icon(Icons.type_specimen),
              onTap: () {
                _onSelectItem(2);
              },
            ),
          ],
        ),
      ),
      body: const Text('Desarrollo para el Campo'),
      //body: _navegacion(pagina),
    );
  }
}
