import 'dart:convert';
import 'package:eventor/entities/user.dart';
import 'package:eventor/services/api_constants.dart';
import 'auth_service.dart';
import 'package:http/http.dart' as http;

class CurrentUserService {

  Future<User> getUserInfo() async {
    String jwt = await AuthService().jwtOrEmpty;
    var res = await http.get(Uri.parse("$serverIP/api/user/me"),
        headers: {'Authorization': jwt});
    if (res.statusCode == 200) {
      Map<String, dynamic> bodyInf = jsonDecode(res.body);
      return User(bodyInf['id'], bodyInf['name'], bodyInf['email'], bodyInf['phone'], bodyInf['work'], bodyInf['pw_hash']);
    } else {
      storage.write(key: "jwt", value: '');
    }
    return User(-1, '', '');
  }

  Future<String> updateUserInfo(User updatedUser) async {
      String jwt = await AuthService().jwtOrEmpty;
      var res = await http.put(Uri.parse("$serverIP/api/user"),
          headers: {'Authorization': jwt, "content-type":"application/json"},
          body: jsonEncode(updatedUser.toJson())
      );
      return res.statusCode.toString();
    }
}