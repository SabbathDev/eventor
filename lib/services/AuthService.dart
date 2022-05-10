import 'package:flutter/material.dart';
import 'package:eventor/domain/user.dart';

class AuthService{
  Future<User> loginIn(String email, String password) async{
    User user = User.fromLogIn(email, password);
    return user;
      //TODO log in logic
  }
  Future<User> signIn(String name, String email, String password) async{
    User user = User.fromLogIn(email, password);
    return user;
    //TODO sign in logic
  }
  Future logOut(String email, String password) async{
    //TODO log out logic
  }
}