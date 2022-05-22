import 'dart:convert';
import 'package:eventor/entities/event.dart';
import 'package:eventor/services/api_constants.dart';
import 'package:http/http.dart' as http;

import 'AuthService.dart';

class EventService{

  Future<List<Event>> getAllActiveEvents() async {

    String jwt = await AuthService().jwtOrEmpty;
    var res = await http.get(Uri.parse("$serverIP/api/event/all/active"),
        headers: {'Authorization': jwt});
    print(res.statusCode.toString());
    if (res.statusCode == 200) {
      List<Event> eventsData;
      eventsData = (jsonDecode(res.body) as List<dynamic>).map((e) => Event.fromJson(e)).toList();
      print(eventsData);
      return eventsData;
    }
    //print(jsonDecode(res.body).toString());
    //print(res.statusCode.toString());
    return <Event>[];
  }
}