import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../services/location_service.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng currentLoc = LatLng(51.5, -0.09);

  final MapController mapController = MapController();

  void _centerOnUser() async{
    currentLoc = await LocationService().getUserLocation();
    mapController.move(currentLoc, 13);
  }

  void _addEvent() { }//TODO logic for event creation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            center: currentLoc, //TODO center on user location
            zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: currentLoc,
                  builder: (ctx) =>
                  const FlutterLogo(),
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _centerOnUser(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}