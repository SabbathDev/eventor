import 'dart:convert';
import 'package:eventor/dao/current_user.dart';
import 'package:eventor/services/api_constants.dart';
import 'package:http/http.dart' as http;


class AuthService {

  Future<String> loginIn(String email, String password) async {

    var res = await http.post(Uri.parse("$serverIP/api/login"),
        headers: {
          "content-type":"application/json"
        },
        body: jsonEncode({"username": email, "password": password}));
    if (res.statusCode == 200) {
      String? jwt = jsonDecode(res.body)['token'];
      storage.write(key: "jwt", value: jwt);
    }
    return res.statusCode.toString();
  }

  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwt");
    if(jwt == null) return "";
    return jwt;
  }

  Future<CurrentUser> getUserInfo() async {

    String jwt = await jwtOrEmpty;
    var res = await http.get(Uri.parse("$serverIP/api/user/me"),
        headers: {'Authorization': jwt});
    if (res.statusCode == 200) {
      Map<String, dynamic> bodyInf = jsonDecode(res.body);
      return CurrentUser(bodyInf['id'], bodyInf['name'], bodyInf['email'], '');
    }
    return CurrentUser(-1, '', '', '');
  }

  Future<String> signIn(String name, String email, String password) async{
    var res = await http.post(Uri.parse("$serverIP/api/registration"),
        headers: {
          "content-type":"application/json"
        },
        body: jsonEncode(
            {
              "id": null,
              "name": name,
              "email": email,
              "phone": "null",
              "work": "null",
              "birthday": "null",
              "photo": null,
              "role": null,
              "pw_hash": password,
              "creatorEvents": [],
              "events": []
            }));
    if (res.statusCode == 200) {
      return loginIn(email, password);
    }
    return res.statusCode.toString();
  }

  Future logOut(String email, String password) async {
    storage.deleteAll();
  }
}