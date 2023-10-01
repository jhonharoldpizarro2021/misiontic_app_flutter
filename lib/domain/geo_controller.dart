import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:permission_handler/permission_handler.dart';

// Controlador de Posicion
class GeoController extends GetxController {
  // Obtener posicion actual
  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition();
  }

  // Obtener el permiso de usar el GPS
  Future<PermissionStatus> requestGpsPermission() async {
    var status = await Permission.location.request();
    //logInfo("requestGpsPermission: $status");
    return Future.value(status);
  }

  // Verificar estado del permiso del sensor
  Future<bool> statusGpsPermission() async {
    try {
      var status = await Permission.location.status;
      //logInfo("statusGpsPermission: $status");
      return Future.value(status.isGranted);
    } catch (e) {
      return Future.value(false);
    }
  }

  // Verificar estado del permiso del GPS
  Future<PermissionStatus> getStatusGpsPermission() async {
    var status = await Permission.location.status;
    //logInfo("getStatusGpsPermission: $status");
    return Future.value(status);
  }
}
