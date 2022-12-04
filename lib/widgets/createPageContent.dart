// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

Widget createPageContent(String? img, String? title, String? content) {
  return Column(
    children: <Widget>[
      // Usamos el widget Image para mostrar una imagen
      AspectRatio(
        aspectRatio: 2 / 1,
        child: Image.network(
          // Como queremos traer una imagen desde un url usamos NetworkImage
          img!,
          fit: BoxFit.cover,
        ),
      ),

      // Usamos Container para el contenedor de la descripción
      Container(
        padding:
            const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
        child: Text(
          title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Text(
          content!,
          style: const TextStyle(
            //fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}
