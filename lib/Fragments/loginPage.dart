// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
//import '../navigationDrawer/navigationDrawer.dart';
import '../routes/pageRoute.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/loginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/images/logo_App.jpg',
              fit: BoxFit.contain,
              height: 52,
            ),
          ],
        ),
      ),
      //drawer: NavigationDrawer(),

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
        child: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                child: const Text(
                  'Desarrollo para el Campo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Ingrese su correo',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese un correo valido';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Ingrese su  contraseña',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese la contraseña';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                  Navigator.pushReplacementNamed(context, PageRoutes.abonos);
                }
              },
              style: ElevatedButton.styleFrom(
                //backgroundColor: Colors.green,
                elevation: 3,
                minimumSize: const Size(100, 40),
              ),
              child: const Text('Iniciar sesion'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text('No tienes cuenta?'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, PageRoutes.registro);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                elevation: 3,
                minimumSize: const Size(100, 40),
              ),
              child: const Text('Registrate'),
            ),
          ),
        ],
      ),
    );
  }
}
