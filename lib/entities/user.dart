class User {
  //entity class for generic user

  late int _userId;
  late String _name;
  late String _email;

  User(this._userId, this._name, this._email);

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }
}