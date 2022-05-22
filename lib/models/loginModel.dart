import 'package:eventor/services/api_constants.dart';
import 'package:flutter/material.dart';

import '../services/AuthService.dart';


class LoginModel{
  bool _isLoggedIn = false;

  Future<void> checkAuth() async {
    _isLoggedIn = await AuthService().jwtCheck(await AuthService().jwtOrEmpty);
  }

  bool get isLogged => _isLoggedIn;
}