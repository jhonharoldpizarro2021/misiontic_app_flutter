// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  String mensaje = "";
  final _user = TextEditingController();
  final _pswd = TextEditingController();
  Timer? _timer;

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    _user.dispose();
    _pswd.dispose();
    super.dispose();
  }

  void _validateConection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // I am not connected to any network.
      setState(() {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('No cuentas con conexion a Internet'),
            );
          },
        );
      });
    } else {
      return;
    }
  }

  // https://firebase.flutter.dev/docs/auth/usage/#persisting-authentication-state
  void _authUsuario() async {
    var msj = "Validando datos ...";
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _user.text, password: _pswd.text);
      msj = "Usuario Autenticado!. Iniciando Session.";
      _user.clear();
      _pswd.clear();
      FirebaseAuth auth = FirebaseAuth.instance;
      auth.setPersistence(Persistence.SESSION);
    } on FirebaseAuthException catch (e) {
      if ((e.code == 'user-not-found') || (e.code == 'wrong-password')) {
        msj = "Usuario/Contraseña errados";
      }
    } catch (e) {
      msj = "Ocurrio un error: $e";
    }
    setState(() {
      mensaje = msj;
      showDialog(
        context: context,
        builder: (context) {
          _timer = Timer(const Duration(seconds: 3), () {
            Navigator.pushReplacementNamed(context, PageRoutes.home);
          });
          return AlertDialog(
            content: Text(mensaje),
          );
        },
      );
    });
  }

  String? _validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese el correo';
    }
    return value.isNotEmpty && !regex.hasMatch(value)
        ? 'Por favor ingrese una dirección de correo valida'
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
              controller: _user,
              decoration: const InputDecoration(
                hintText: 'Ingrese su correo',
              ),
              //validator: _validateEmail,
              validator: _validateEmail,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              controller: _pswd,
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
                  //Validate COnection
                  _validateConection();
                  // Process data.
                  _authUsuario();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 3,
                minimumSize: const Size(100, 40),
              ),
              child: const Text('Iniciar sesioneeee'),
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
                _validateConection();
                Navigator.pushReplacementNamed(context, PageRoutes.registro);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
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
