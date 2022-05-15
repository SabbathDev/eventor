import 'package:eventor/entities/current_user.dart';

class AuthService{
  Future<CurrentUser> loginIn(String email, String password) async{
    //TODO log in logic

    int cUserId = 1;    //TODO fetch user data after the login
    String cUserName = "Robbie Rotten";
    String cUserToken = "plz someone do the login logic";
    return CurrentUser(cUserId, cUserName, email, cUserToken);
  }

  Future<CurrentUser> signIn(String name, String email, String password) async{
    //TODO sign in logic

    int cUserId = 1;    //TODO fetch user data after the sign in
    String cUserToken = "plz someone do the registration logic";
    return CurrentUser(cUserId, name, email, cUserToken);
  }

  Future logOut() async{
    //TODO log out logic
  }
}