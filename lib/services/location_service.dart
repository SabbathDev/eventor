import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationService{
  LatLng finalpos = LatLng(51.5, -0.09);

  Future<LatLng> getUserLocation() =>
      GeolocatorPlatform.instance.getCurrentPosition().
        then((value) => LatLng(value.latitude, value.longitude)
      );
}