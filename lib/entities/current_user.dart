import 'package:eventor/entities/user.dart';

class CurrentUser extends User{
  //entity class for the currently logged in user

  late String _token;

  CurrentUser(_userId, _name, _email, this._token) :
    super(_userId, _name, _email);

  String get token => _token;

  set token(String value) {
    _token = value;
  }
}