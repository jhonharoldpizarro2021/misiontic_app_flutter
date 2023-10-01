import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../domain/producto_controller.dart';
import '../model/producto.dart';

class CreateProductoWidget extends StatefulWidget {
  const CreateProductoWidget({Key? key}) : super(key: key);

  @override
  State<CreateProductoWidget> createState() => _CreateProductoWidgetState();
}

class _CreateProductoWidgetState extends State<CreateProductoWidget> {
  // Controladores Get
  ProductoController pdtCtrl = Get.find();
  // Controladores Widgets
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String mensaje = "";
  final _nombre = TextEditingController();
  final _descripcion = TextEditingController();
  final _valor = TextEditingController();
  Timer? _timer;
  List<String> list = <String>['Nuevo'];

  // Metodo para iniciar la instancia de los listeners
  @override
  void initState() {
    super.initState();
    pdtCtrl.start();
  }

  // Metodo para detener la instancia de los listeners
  @override
  void dispose() {
    _nombre.dispose();
    _descripcion.dispose();
    _valor.dispose();
    pdtCtrl.stop();
    super.dispose();
  }

  // Widget para el input de texto
  Widget _productoForm() {
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
                  'Crear Producto',
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
              controller: _nombre,
              decoration: const InputDecoration(
                hintText: 'Nombre',
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
            child: TextFormField(
              controller: _descripcion,
              decoration: const InputDecoration(
                hintText: 'Descripcion',
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
            child: TextFormField(
              controller: _valor,
              decoration: const InputDecoration(
                hintText: 'Valor',
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
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: _addProducto,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                elevation: 3,
                minimumSize: const Size(100, 40),
              ),
              child: const Text('Guardar Producto'),
            ),
          ),
        ],
      ),
    );
  }

  // Metodo para guardar producto
  Future<void> _addProducto() async {
    var mensaje = "Creando Poducto ...";
    try {
      await pdtCtrl.addProducto(
          Producto(_nombre.text, _descripcion.text, _valor.text, 'Nuevo'));
      mensaje = "Poducto creado con exito!!";
      _nombre.clear();
      _descripcion.clear();
      _valor.clear();
    } catch (e) {
      mensaje = "Ocurrio un error: $e";
    }
    setState(() {
      showDialog(
        context: context,
        builder: (context) {
          _timer = Timer(const Duration(seconds: 3), () {
            //Navigator.pushReplacementNamed(context, PageRoutes.home);
          });
          return AlertDialog(
            title: const Text('Crear Producto'),
            content: Text(mensaje),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: _productoForm(),
        ),
      ],
    );
  }
}
