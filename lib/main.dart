import 'package:eventor/pages/edit_profile.dart';
import 'package:eventor/pages/login.dart';
import 'package:eventor/pages/registration.dart';
import 'package:flutter/material.dart';
import 'package:eventor/theme/theme_constants.dart';

void main() => runApp(const Eventor());


class Eventor extends StatelessWidget {
  const Eventor({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: lightTheme,
      darkTheme: darkTheme,

      themeMode: ThemeMode.dark,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/login/registration': (context) => const RegistrationPage(),
        '/profile/edit': (context) => const EditProfilePage(),
      },
    );
  }
}
