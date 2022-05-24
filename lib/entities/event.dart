import 'package:eventor/entities/user.dart';
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


  Event(this._eventId, this._name, this._description, double longitude,
      double latitude, this._creatorId, this._startDate, this._endDate, this._price){
    _location = LatLng(latitude, longitude);
    _setStatusAndDuration();
  }

  void _setStatusAndDuration(){
    DateTime simpleDate = DateTime.now();
    if(simpleDate.isBefore(_startDate)){
      _status = 'Scheduled';
      _duration = _startDate.difference(simpleDate);
    }else {
      if (simpleDate.isBefore(_endDate)) {
        _status = 'Started';
        _duration = _endDate.difference(simpleDate);
      } else {
        if (simpleDate.isAfter(_endDate)) {
          _status = 'Ended';
        }
      }
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

}