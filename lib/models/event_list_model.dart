import 'package:flutter/material.dart';

import '../entities/event.dart';
import '../services/eventService.dart';

class EventListModel extends ChangeNotifier{
  final _allActiveEvents = <Event>[];
  final _myActiveEvents = <Event>[];
  final _myArchiveEvents = <Event>[];
  final _mySubscribedEvents = <Event>[];

  Future<void> loadAllEvents() async{
    await loadAllActiveEvents();
    await loadMyActiveEvents();
    await loadMyArchiveEvents();
    await loadMySubscribedEvents();
    notifyListeners();
  }

  Future<void> loadAllActiveEvents() async{
    List<Event> eventsResponse;
    eventsResponse = await EventService().getAllActiveEvents() as List<Event>;
    _allActiveEvents.clear();
    _allActiveEvents.addAll(eventsResponse);
    notifyListeners();
  }

  Future<void> loadMyActiveEvents() async{
    List<Event> eventsResponse;
    eventsResponse = await EventService().getMyActiveEvents() as List<Event>;
    _myActiveEvents.clear();
    _myActiveEvents.addAll(eventsResponse);
    notifyListeners();
  }

  Future<void> loadMyArchiveEvents() async{
    List<Event> eventsResponse;
    eventsResponse = await EventService().getMyArchiveEvents() as List<Event>;
    _myArchiveEvents.clear();
    _myArchiveEvents.addAll(eventsResponse);
    notifyListeners();
  }

  Future<void> loadMySubscribedEvents() async{
    List<Event> eventsResponse;
    eventsResponse = await EventService().getMySubscribedEvents() as List<Event>;
    _mySubscribedEvents.clear();
    _mySubscribedEvents.addAll(eventsResponse);
    notifyListeners();
  }

  List<Event> get allActiveEvents => List.unmodifiable(_allActiveEvents);
  List<Event> get myActiveEvents => List.unmodifiable(_myActiveEvents);
  List<Event> get myArchiveEvents => List.unmodifiable(_myArchiveEvents);
  List<Event> get mySubscribedEvents => List.unmodifiable(_mySubscribedEvents);
}