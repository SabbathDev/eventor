class User {
  //entity class for generic user

  late int _userId;
  late String _name;
  late String _email;
  late String _phone;
  late String _work;
  late String _pw_hash;




  User(this._userId, this._name, [this._email = '', this._phone = '', this._work = '', this._pw_hash = '']);

  factory User.fromJson(Map<String, dynamic> data) {
    final userId = data['id'] as int;

    var name = data['name'] as String?;
    name ??= '';
    var email = data['email'] as String?;
    email ??= '';
    var phone = data['phone'] as String?;
    phone ??= '';
    var work = data['work'] as String?;
    work ??= '';
    var pw_hash = data['pw_hash'] as String?;
    pw_hash ??= '';

    return User(userId, name, email, phone, work, pw_hash);
  }


  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      "id": _userId,
      "name": _name,
      "email": _email,
      "phone": _phone,
      "work": _work,
      "role": "USER",
      "pw_hash": _pw_hash,
    };
  }



  String get pw_hash => _pw_hash;

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

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get work => _work;

  set work(String value) {
    _work = value;
  }
}