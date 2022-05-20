import 'package:flutter/material.dart';

import '../entities/event.dart';
import '../services/eventService.dart';

class EventListModel extends ChangeNotifier{
  final _events = <Event>[];
  Future<void> loadAllActiveEvents() async{
    final eventsResponse = await EventService().getAllActiveEvents();
    _events.addAll(eventsResponse);
    notifyListeners();
  }

  List<Event> get events => List.unmodifiable(_events);
}