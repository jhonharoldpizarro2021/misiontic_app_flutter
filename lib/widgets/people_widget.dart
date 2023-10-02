import 'package:firebase_auth/firebase_auth.dart';
import 'package:loggy/loggy.dart';

import '../domain/geo_controller.dart';
import '../domain/people_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/people.dart';

class PeopleWidget extends StatefulWidget {
  const PeopleWidget({Key? key}) : super(key: key);

  @override
  State<PeopleWidget> createState() => _PeopleWidgetState();
}

class _PeopleWidgetState extends State<PeopleWidget> {
  // Controladores Get
  PeopleController plpCtrl = Get.find();
  GeoController geoCtrl = Get.find();
  // Controladores Widgets
  final TextEditingController _msgCtrl = TextEditingController();
  final ScrollController _scrollCtrl = ScrollController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  late String lat = '0.i';
  late String long = '0.i';

  // Metodo para iniciar la instancia de los listeners
  @override
  void initState() {
    super.initState();
    plpCtrl.init();
    _getPosition();
  }

  void onStart() {}

  // Metodo para detener la instancia de los listeners
  @override
  void dispose() {
    plpCtrl.destroy();
    super.dispose();
  }

  // Widget encargado de mostrar los mensajes que se encuentren
  // registrados en la base de datos
  Widget _messageCard(People msg, int index) {
    return Card(
      margin: const EdgeInsets.only(left: 50, top: 10, bottom: 10, right: 10),
      color: Colors.blue[100],
      child: ListTile(
        title: Text(
          msg.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text("${msg.latitude}, ${msg.longitude}"),
        onTap: () async {
          var lati = msg.latitude;
          var lng = msg.longitude;
          String googleUrl =
              'https://www.google.com/maps/search/?api=1&query=${msg.latitude},${msg.longitude}';
          String mapUrl = "geo:$lati,$lng";
          if (await canLaunch(googleUrl)) {
            await launch(googleUrl);
          }
        },
      ),
    );
  }

  // Widget encargado de mostrar el listado de mensajes en la}
  // base de datos
  Widget _messageList() {
    return GetX<PeopleController>(
      builder: ((controller) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());
        return ListView.builder(
          itemCount: plpCtrl.peoples.length,
          controller: _scrollCtrl,
          itemBuilder: ((context, index) {
            var msg = plpCtrl.peoples[index];
            return _messageCard(msg, index);
          }),
        );
      }),
    );
  }

  // Hacer scroll de los mensajes nuevos
  _scrollToEnd() async {
    _scrollCtrl.animateTo(
      _scrollCtrl.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void _openSettings() async {
    var status = await geoCtrl.getStatusGpsPermission();
    if (status.isPermanentlyDenied || status.isDenied) {
      openAppSettings();
    }
  }

  void _getPosition() async {
    try {
      var status = await geoCtrl.getStatusGpsPermission();
      if (status.isDenied) {
        status = await geoCtrl.requestGpsPermission();
      }
      if (status.isGranted) {
        var pst = await geoCtrl.getCurrentPosition();
        lat = pst.latitude.toString();
        long = pst.longitude.toString();
        _add();
      } else {
        lat = "0.d";
        long = "0.d";
      }
    } catch (e) {
      logInfo("error _getPositon: $e");
      lat = "0.e";
      long = "0.e";
    }
  }

  // Metodo para enviar mensajes
  Future<void> _add() async {
    final User? user = auth.currentUser;
    final email = user!.email;
    _openSettings();
    await plpCtrl.add(People(
        name: DateTime.now().toString(), latitude: lat, longitude: long));
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: _messageList(),
        ),
      ],
    );
  }
}
