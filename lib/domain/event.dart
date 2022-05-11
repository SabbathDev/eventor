

class Event {
  late String _name;
  late String _description;
  late double _locationX;
  late double _locationY;
  late int _creatorId;
  late DateTime _dateTime;
  late Duration _duration;
  late String _type;


  Event(this._name, this._description, this._locationX, this._locationY,
      this._creatorId, this._dateTime, this._duration, this._type);

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

  double get location_y => _locationY;

  set location_y(double value) {
    _locationY = value;
  }

  double get location_x => _locationX;

  set location_x(double value) {
    _locationX = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }
}