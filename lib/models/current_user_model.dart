
import 'package:eventor/entities/user.dart';
import 'package:eventor/services/current_user_service.dart';
import 'package:flutter/cupertino.dart';

class CurrentUserModel extends ChangeNotifier{
  late User _currentUser;

  Future<void> loadCurrentUser() async{
    _currentUser = await CurrentUserService().getUserInfo();
    notifyListeners();
  }

  Future<String> updateCurrentUser(String name, String email, String phone, String work) async{
    await loadCurrentUser();
    User updatedUser = User(_currentUser.userId, name, email, phone, work, _currentUser.pw_hash);
    String statusCode = await CurrentUserService().updateUserInfo(updatedUser);
    await loadCurrentUser();
    notifyListeners();
    return statusCode;
  }

  User get currentUser => _currentUser;
}