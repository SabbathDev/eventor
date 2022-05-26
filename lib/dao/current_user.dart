import 'package:eventor/entities/user.dart';

class CurrentUser extends User{
  //entity class for the currently logged in user

  late String _email;

  CurrentUser(_userId, _name, this._email) :
    super(_userId, _name);

  String get email => _email;

  set email(String value) {
    _email = value;
  }
}