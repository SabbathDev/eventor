import 'package:eventor/models/event_list_model.dart';
import 'package:eventor/services/marker_generator.dart';
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
  late LatLng currentLoc;
  late List<Marker> markers;
  final MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
    markers = MarkerGenerator(EventListModel().events).generate();
    centerOnUser();
  }

  void centerOnUser() async {
    currentLoc = await LocationService().getUserLocation();
    mapController.move(currentLoc, 13);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(markers: markers),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/map/createEvent'),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
