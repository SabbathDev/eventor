import 'package:eventor/pages/login.dart';
import 'package:eventor/pages/registration.dart';
import 'package:flutter/material.dart';
import 'package:eventor/theme/theme_constants.dart';

void main() => runApp(const Eventor());


class Eventor extends StatefulWidget {
  const Eventor({Key? key}) : super(key: key);

  @override
  State<Eventor> createState() => _EventorState();
}

class _EventorState extends State<Eventor> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,

      themeMode: ThemeMode.light,

      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/login/registration': (context) => const RegistrationPage(),
      },
    );
  }
}
