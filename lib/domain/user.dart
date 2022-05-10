import 'package:flutter/material.dart';

class User {
  late String _token;
  late String _name;
  late String _email;
  late String _password;

  User(this._token, this._name, this._email, this._password);

  User.fromLogIn(String email, String password){
    _token = ''; // TODO auth service logic
    _name = '';
    _email = email;
    _password = password;
  }

  // User.New(String name, String email, String password){
  //   this._name = name;
  // };

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }
}