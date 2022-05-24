import '../services/auth_service.dart';


class LoginModel{
  bool _isLoggedIn = false;

  Future<void> checkAuth() async {
    _isLoggedIn = await AuthService().jwtCheck(await AuthService().jwtOrEmpty);
  }

  bool get isLogged => _isLoggedIn;
}