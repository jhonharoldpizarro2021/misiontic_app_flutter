import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../model/producto.dart';

class ProductoController extends GetxController {
  // Constantes
  final String dbName = "productos";
  // Variable que maneja el listado de mensajes
  // que vienen de la base de datos en tiempo real
  var productos = <Producto>[].obs;

  // Variables necesaria para la configuracion de
  // las bases de datos en tiempo real
  final db = FirebaseDatabase.instance.ref();
  late StreamSubscription<DatabaseEvent> newData;
  late StreamSubscription<DatabaseEvent> updateData;

  // Metodo para iniciar los listeners
  start() {
    productos.clear();
    newData = db.child(dbName).onChildAdded.listen(_onAddData);
    updateData = db.child(dbName).onChildChanged.listen(_onUpdateData);
  }

  // Metodo para detener los listeners
  stop() {
    newData.cancel();
    updateData.cancel();
  }

  // Metodo que escucha los nuevos registros
  _onAddData(DatabaseEvent event) {
    logInfo('Data was Add...');
    final json = event.snapshot.value as Map<dynamic, dynamic>;
    productos.add(Producto.fromJson(event.snapshot, json));
  }

  // Metodo que escucha las actualizaciones de registros
  _onUpdateData(DatabaseEvent event) {
    logInfo('Data was Updated...');
    var oldData = productos.singleWhere((element) {
      return element.key == event.snapshot.key;
    });

    final json = event.snapshot.value as Map<dynamic, dynamic>;
    productos[productos.indexOf(oldData)] =
        Producto.fromJson(event.snapshot, json);
  }

  // Metodo para agregar mensajes
  Future<void> addProducto(Producto msg) async {
    logInfo('New Producto...');
    try {
      db.child(dbName).push().set(msg.toJson());
    } catch (e) {
      logError('Error Add: $e');
      return Future.error(e);
    }
  }

  // Metodo para actualizar mensajes
  Future<void> updateProducto(Producto msg) async {
    logInfo('Update Producto... $msg.key');
    try {
      db.child(dbName).child(msg.key!).set(msg.toJson());
    } catch (e) {
      logError('Error Update: $e');
      return Future.error(e);
    }
  }

  // Metodo para eliminar mensajes
  Future<void> deleteProducto(Producto msg, int index) async {
    logInfo('Delete Producto... $msg.key');
    try {
      db
          .child(dbName)
          .child(msg.key!)
          .remove()
          .then((value) => productos.removeAt(index));
    } catch (e) {
      logError('Error Delete: $e');
      return Future.error(e);
    }
  }
}
