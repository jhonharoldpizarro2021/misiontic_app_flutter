// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../navigationDrawer/navigationDrawer.dart';
import '../routes/pageRoute.dart';
import '../widgets/createProduct.dart';

class NewproductPage extends StatefulWidget {
  static const String routeName = '/newProductPage';

  @override
  _NewproductPageState createState() => _NewproductPageState();
}

class _NewproductPageState extends State<NewproductPage> {
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
                  child: const Text('Crear Producto')),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              tooltip: 'Regresar',
              onPressed: () {
                Navigator.pushReplacementNamed(context, PageRoutes.productos);
              },
            ),
          ],
          /* actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Regresar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ], */
        ),
        drawer: NavigationDrawer2(),
        //body: const CreateProductoWidget(),
        body: Container(
          padding:
              const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/login.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: const CreateProductoWidget(),
        ));
  }
}
