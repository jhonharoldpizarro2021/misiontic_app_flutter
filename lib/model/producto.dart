import 'package:firebase_database/firebase_database.dart';

class Producto {
  String? key;
  String nombre;
  String? descripcion;
  String valor;
  String estado;

  Producto(this.nombre, this.descripcion, this.valor, this.estado);

  Producto.fromJson(DataSnapshot snapshot, Map<dynamic, dynamic> json)
      : key = snapshot.key ?? '0',
        nombre = json['nombre'] ?? '',
        descripcion = json['descripcion'] ?? '',
        valor = json['valor'] ?? '0',
        estado = json['estado'] ?? '';

  toJson() {
    return {"nombre": nombre, "descripcion": descripcion, "valor": valor};
  }
}
