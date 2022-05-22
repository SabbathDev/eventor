import 'package:permission_handler/permission_handler.dart';

class PermissionRequester {
  final Permission permission;

  PermissionRequester(this.permission);

  Future<void> request() async {
    print("Checking permission for " + permission.toString());

    PermissionStatus status = await permission.status;

    if (!status.isLimited && !status.isGranted) {
      print("Requesting permission for " + permission.toString());

      final PermissionStatus result = await permission.request();
      if (!result.isGranted) {
        print("Permission was not granted");
        return;
      }
    }
  }
}