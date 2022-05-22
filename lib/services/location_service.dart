import 'dart:async';
import 'package:eventor/services/permission_requester.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService{
  late final LatLng pos = LatLng(51.5, -0.09);
  PermissionRequester requester = PermissionRequester(Permission.locationWhenInUse);

  Future<LatLng> getUserLocation() =>
      requester.request().then((p) =>
      GeolocatorPlatform.instance.getCurrentPosition().
        then((value) => LatLng(value.latitude, value.longitude)
      ));
}