import 'package:flutter/material.dart';

import '../entities/event.dart';
import '../services/eventService.dart';

class EventListModel extends ChangeNotifier{
  final _allActiveEvents = <Event>[];
  final _myEvents = <Event>[];

  Future<void> loadAllEvents() async{
    await loadAllActiveEvents();
    await loadMyEvents();
    notifyListeners();
  }

  Future<void> loadAllActiveEvents() async{

    List<Event> eventsResponse;
    eventsResponse = await EventService().getAllActiveEvents() as List<Event>;
    _allActiveEvents.clear();
    _allActiveEvents.addAll(eventsResponse);
    notifyListeners();
  }

  Future<void> loadMyEvents() async{

    List<Event> eventsResponse;
    eventsResponse = await EventService().getMyActiveEvents() as List<Event>;
    _myEvents.clear();
    _myEvents.addAll(eventsResponse);
    notifyListeners();
  }

  List<Event> get allActiveEvents => List.unmodifiable(_allActiveEvents);
  List<Event> get myEvents => List.unmodifiable(_myEvents);
}