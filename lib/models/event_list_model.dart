import 'package:flutter/material.dart';

import '../entities/event.dart';
import '../services/eventService.dart';

class EventListModel extends ChangeNotifier{
  final _events = <Event>[];
  Future<void> loadAllActiveEvents() async{

    List<Event> eventsResponse;
    eventsResponse = await EventService().getAllActiveEvents() as List<Event>;
    _events.clear();
    _events.addAll(eventsResponse);
    notifyListeners();
  }

  List<Event> get events => List.unmodifiable(_events);
}