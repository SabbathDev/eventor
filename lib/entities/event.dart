import 'package:eventor/entities/user.dart';
import 'package:latlong2/latlong.dart';

class Event {
  //entity class for an event

  late int _eventId;
  late String _name;
  late String _description;
  late LatLng _location;
  late int _creatorId;
  late DateTime _dateTime;
  late String _duration;

  Event(this._eventId, this._name, this._description, double locationX,
      double locationY, this._creatorId, this._dateTime, this._duration){
    _location = LatLng(locationX, locationY);
  }

  factory Event.fromJson(Map<String, dynamic> data) {
    var creator = User.fromJson(data['creator']);
    var eventId = data['id'] as int;
    var name = data['name'] as String;
    var description = data['description'] as String;
    var locationX = data['longitude'] as double;
    var locationY = data['latitude'] as double;
    var creatorId = creator.userId;
    DateTime dateTime = DateTime.parse(data['date'] as String);
    var duration = creator.name;
    return Event(eventId, name, description, locationX, locationY, creatorId, dateTime, duration);
  }

  int get eventId => _eventId;

  set eventId(int value){
    _eventId = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  DateTime get dateTime => _dateTime;

  set dateTime(DateTime value) {
    _dateTime = value;
  }

  int get creator_id => _creatorId;

  set creator_id(int value) {
    _creatorId = value;
  }

  LatLng get location => _location;

  set location(LatLng value) {
    _location = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }
}