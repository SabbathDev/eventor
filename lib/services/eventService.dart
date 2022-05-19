import 'dart:convert';
import 'package:eventor/entities/event.dart';
import 'package:eventor/services/api_constants.dart';
import 'package:http/http.dart' as http;

import 'AuthService.dart';

class EventService{
  Future<List<dynamic>> getAllActiveEvents() async {

    String jwt = await AuthService().jwtOrEmpty;
    var res = await http.get(Uri.parse("$serverIP/api/event/all/active"),
        headers: {'Authorization': jwt});
    print(res.statusCode.toString());
    if (res.statusCode == 200) {
      final eventsData = jsonDecode(res.body) as List<dynamic>?;
      print(eventsData);
      eventsData!.map((eventsData) => Event.fromJson(eventsData)).toList();
      return eventsData;
    }
    //print(jsonDecode(res.body).toString());
    //print(res.statusCode.toString());
    return <List<dynamic>>[];
  }
}