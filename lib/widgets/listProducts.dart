import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../domain/producto_controller.dart';
import '../model/producto.dart';

class ProductosWidget extends StatefulWidget {
  const ProductosWidget({Key? key}) : super(key: key);

  @override
  State<ProductosWidget> createState() => _ProductosWidgetState();
}

class _ProductosWidgetState extends State<ProductosWidget> {
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

  // Widget encargado de mostrar el listado de mensajes en la}
  // base de datos
  Widget _productosList() {
    return GetX<ProductoController>(
      builder: ((controller) {
        return GridView.count(
          padding: const EdgeInsets.all(15),
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(pdtCtrl.productos.length, (int index) {
            String names;
            if (pdtCtrl.productos.isNotEmpty) {
              names = pdtCtrl.productos[index].nombre;
            } else {
              names = '';
            }
            String fotos;
            if (pdtCtrl.productos.isNotEmpty) {
              fotos = pdtCtrl.productos[index].descripcion!;
            } else {
              fotos = '';
            }
            String url;
            if (pdtCtrl.productos.isNotEmpty) {
              url = pdtCtrl.productos[index].descripcion!;
            } else {
              url = '';
            }
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              margin: const EdgeInsets.all(15),
              elevation: 10,
              child: InkWell(
                onTap: () => Navigator.pushReplacementNamed(context, url),
                child: ClipRRect(
                  // Los bordes del contenido del card se cortan usando BorderRadius
                  borderRadius: BorderRadius.circular(0),
                  // EL widget hijo que será recortado segun la propiedad anterior
                  child: Column(
                    children: <Widget>[
                      // Usamos el widget Image para mostrar una imagen
                      AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Image.asset(
                          // Como queremos traer una imagen desde un url usamos NetworkImage
                          'lib/images/biol.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Usamos Container para el contenedor de la descripción
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          names,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        );
        /* return ListView.builder(
            shrinkWrap: true,
            //itemCount: 10,
            itemCount: pdtCtrl.productos.length,
            controller: _scrollCtrl,
            itemBuilder: ((context, index) {
              var msg = pdtCtrl.productos[index];
              return _productoCard(msg, index);
            }),
          ); */
      }),
    );
  }

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
                //padding: const EdgeInsets.only(top: 20),
                child: const Text(
                  'Crear Producto',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 20,
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
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: _productosList(),
        ),
        Container(
          padding:
              const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
          child: _productoForm(),
        ),
      ],
    );
  }
}
