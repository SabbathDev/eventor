import 'package:latlong2/latlong.dart';

class Event {
  //entity class for an event

  late int _eventId;
  late String _name;
  late String _description;
  late LatLng _location;
  late int _creatorId;
  late DateTime _dateTime;
  late Duration _duration;
  late String _type;

  Event(this._eventId, this._name, this._description, double locationX,
      double locationY, this._creatorId, this._dateTime, this._duration,
      this._type){
    _location = LatLng(locationX, locationY);
  }

  int get eventId => _eventId;

  set eventId(int value){
    _eventId = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get type => _type;

  set type(String value) {
    _type = value;
  }

  Duration get duration => _duration;

  set duration(Duration value) {
    _duration = value;
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