class User {
  //entity class for generic user

  late int _userId;
  late String _name;

  User(this._userId, this._name);

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}