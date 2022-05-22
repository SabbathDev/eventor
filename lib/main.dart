import 'package:eventor/models/eventListModel.dart';
import 'package:eventor/pages/edit_profile.dart';
import 'package:eventor/pages/login.dart';
import 'package:eventor/pages/main_screen.dart';
import 'package:eventor/pages/registration.dart';
import 'package:flutter/material.dart';
import 'package:eventor/theme/theme_constants.dart';
import 'package:provider/provider.dart';
import 'models/loginModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final loginModel = LoginModel();
  await loginModel.checkAuth();
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => EventListModel()),
      ],
        child: Eventor(loginModel: loginModel),
      )
  );
}


class Eventor extends StatelessWidget {
  final LoginModel loginModel;
  const Eventor({Key? key, required this.loginModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: lightTheme,
      darkTheme: darkTheme,

      themeMode: ThemeMode.dark,
      initialRoute: loginModel.isLogged ? '/main_screen' : '/login',
      routes: {
        '/login': (context) => const Login(),
        '/login/registration': (context) => const RegistrationPage(),
        '/profile/edit': (context) => const EditProfilePage(),
        '/main_screen': (context) => const MainScreen(),
      },
    );
  }
}
