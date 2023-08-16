import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {

  ///permission_handler: ^10.2.0



  void permission() async {
    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.locationAlways,
      Permission.camera,
      Permission.locationWhenInUse,
      Permission.speech,
      Permission.storage,
      Permission.manageExternalStorage,
      //add more permission to request here.
    ].request();

    if (statuses[Permission.location]!.isDenied) {
      //check each permission status after.
      print("Location permission is denied.");
    }
    if (statuses[Permission.storage]!.isDenied) {
      //check each permission status after.
      print("Camera permission is denied.");
    }
  }
}