import 'package:eventor/entities/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MarkerGenerator {
  late List<Event> events;

  MarkerGenerator(this.events);

  List<Marker> generate() {
    List<Marker> list = [];

    for (var e in events) {
      list.add(
          Marker(point: e.location, builder: (ctx) => const FlutterLogo()));
    }
    return list;
  }
}
