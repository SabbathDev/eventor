import 'package:eventor/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class Event {
  //entity class for an event

  late int _eventId;
  late String _name;
  late String _description;
  late LatLng _location;
  late int _creatorId;
  late DateTime _startDate;
  late DateTime _endDate;
  late double _price;
  late String _status;
  late Duration _duration;
  late Color _statusColor;


  Event(this._eventId, this._name, this._description, double longitude,
      double latitude, this._creatorId, this._startDate, this._endDate, this._price){
    _location = LatLng(latitude, longitude);
    _setStatusAndDuration();
  }

  void _setStatusAndDuration(){
    DateTime simpleDate = DateTime.now();
    if(simpleDate.isBefore(_startDate)){
      _status = 'Scheduled';
      _statusColor = Colors.grey;
      _duration = _startDate.difference(simpleDate);
      return;
    }
    if (simpleDate.isBefore(_endDate)) {
      _status = 'Started';
      _statusColor = Colors.green;
      _duration = _endDate.difference(simpleDate);
      return;
    }
    if (simpleDate.isAfter(_endDate)) {
      _duration = const Duration(days: 0);
      _statusColor = Colors.red;
      _status = 'Ended';
      return;
    }
  }

  factory Event.fromJson(Map<String, dynamic> data) {
    var creator = User.fromJson(data['creator']);
    var eventId = data['id'] as int;
    var name = data['name'] as String;
    var description = data['description'] as String;
    var longitude = data['longitude'] as double;
    var latitude = data['latitude'] as double;
    var creatorId = creator.userId;
    DateTime startDate = DateTime.parse(data['startDate'] as String);
    DateTime endDate = DateTime.parse(data['endDate'] as String);
    var price = data['price'] as double;
    return Event(eventId, name, description, longitude, latitude, creatorId, startDate, endDate, price);
  }

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      "id": null,
      "name": _name,
      "description": _description,
      "image": null,
      "longitude": _location.longitude,
      "latitude": _location.latitude,
      "price": _price,
      "startDate": _startDate.toIso8601String(),
      "endDate": _endDate.toIso8601String(),
      "status": _status,
      "archive": false,
      "users": [],
      "creator": {
        "id": _creatorId,
        "name": null,
        "email": null,
        "phone": null,
        "work": null,
        "birthday": null,
        "photo": null,
        "role": null,
        "pw_hash": null,
        "creatorEvents": null,
        "events": null
      }
    };
  }

  int get eventId => _eventId;

  String get name => _name;

  int get creatorId => _creatorId;

  LatLng get location => _location;

  String get description => _description;

  DateTime get startDate => _startDate;

  DateTime get endDate => _endDate;

  double get price => _price;

  String get status => _status;

  Duration get duration => _duration;

  Color get statusColor => _statusColor;
}