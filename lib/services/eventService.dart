import 'dart:convert';
import 'package:eventor/entities/event.dart';
import 'package:eventor/services/api_constants.dart';
import 'package:http/http.dart' as http;
import 'auth_service.dart';


class EventService{

  Future<List<Event>> getAllActiveEvents() async {
    String jwt = await AuthService().jwtOrEmpty;
    var res = await http.get(Uri.parse("$serverIP/api/event/all/active"),
        headers: {'Authorization': jwt});

    print('Get all Active Events code ${res.statusCode.toString()}');

    if (res.statusCode == 200) {
      List<Event> eventsData;
      eventsData = (jsonDecode(res.body) as List<dynamic>).map((e) => Event.fromJson(e)).toList();
      return eventsData;
    }
    return <Event>[];
  }

  Future<String> setNewEvent(Event event) async {
    String jwt = await AuthService().jwtOrEmpty;
    var res = await http.post(Uri.parse("$serverIP/api/event"),
        headers: {'Authorization': jwt, "content-type":"application/json"},
        body: jsonEncode(event.toJson())
    );

    print('Set new Event code ${res.statusCode.toString()}');

    if (res.statusCode == 200) {
      return res.statusCode.toString();
    }
    return res.statusCode.toString();
  }

  Future<List<Event>> getMyActiveEvents() async {
    String jwt = await AuthService().jwtOrEmpty;
    var res = await http.get(Uri.parse("$serverIP/api/event/my/active"),
        headers: {'Authorization': jwt});

    print('Get my Active Events code ${res.statusCode.toString()}');

    if (res.statusCode == 200) {
      List<Event> eventsData;
      eventsData = (jsonDecode(res.body) as List<dynamic>).map((e) => Event.fromJson(e)).toList();
      return eventsData;
    }
    return <Event>[];
  }

  Future<List<Event>> getMyArchiveEvents() async {
    String jwt = await AuthService().jwtOrEmpty;
    var res = await http.get(Uri.parse("$serverIP/api/event/my/expired"),
        headers: {'Authorization': jwt});

    print('Get my Archive Events code ${res.statusCode.toString()}');

    if (res.statusCode == 200) {
      List<Event> eventsData;
      eventsData = (jsonDecode(res.body) as List<dynamic>).map((e) => Event.fromJson(e)).toList();
      return eventsData;
    }

    return <Event>[];
  }

  Future<List<Event>> getMySubscribedEvents() async {
    String jwt = await AuthService().jwtOrEmpty;
    var res = await http.get(Uri.parse("$serverIP/api/event/subscriptions"),
        headers: {'Authorization': jwt});

    print('Get my Subscribed Events code ${res.statusCode.toString()}');

    if (res.statusCode == 200) {
      List<Event> eventsData;
      eventsData = (jsonDecode(res.body) as List<dynamic>).map((e) => Event.fromJson(e)).toList();
      return eventsData;
    }

    return <Event>[];
  }
}