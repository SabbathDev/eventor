import 'package:eventor/entities/user.dart';

class CurrentUser extends User{
  //entity class for the currently logged in user

  late String _token;
  late String _email;

  CurrentUser(_userId, _name, this._email, this._token) :
    super(_userId, _name);

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  int get userId => super.userId;
}