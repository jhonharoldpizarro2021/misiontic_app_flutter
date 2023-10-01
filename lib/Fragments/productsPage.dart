// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, no_leading_underscores_for_local_identifiers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../domain/producto_controller.dart';
import '../widgets/listProducts.dart';

import '../navigationDrawer/navigationDrawer.dart';
import '../routes/pageRoute.dart';
//import '../widgets/createAppBar.dart';

class ProductsPage extends StatefulWidget {
  static const String routeName = '/productosPage';
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      // signed out
      Navigator.pushReplacementNamed(context, PageRoutes.login);
    }
    Get.put(ProductoController());
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
                child: const Text('Productos')),
          ],
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, PageRoutes.home);
                },
                child: const Icon(Icons.arrow_back),
              )),
        ],
      ),
      drawer: NavigationDrawer2(),
      body: const ProductosWidget(),
    );
  }
}
