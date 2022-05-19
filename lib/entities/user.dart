class User {
  //entity class for generic user

  late int _userId;
  late String _name;

  User(this._userId, this._name);

  factory User.fromJson(Map<String, dynamic> data) {
    final userId = data['id'] as int;
    var name = data['name'] as String?;
    name ??= '';
    return User(userId, name);
  }
  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}