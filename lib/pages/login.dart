import 'package:eventor/services/AuthService.dart';
import 'package:flutter/material.dart';

import '../domain/user.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();

  late String _email;
  late String _password;
  bool isLogged = false;

  void _buttonAction() async{
    _email = _emailController.text;
    _password = _passwordController.text;
    print(_email + "  " + _password ); //TODO logic for log in auth
    User user = await _authService.loginIn(_email, _password);
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Center(
                child: Image(image: AssetImage('assets/images/logo.png')),
              ),
              Center(
                  child: Text(
                'DISCOVER POPULAR EVENTS & NEARBY FUN',
                style: Theme.of(context).textTheme.headline1,
              )),
              const SizedBox(
                height: 100.0,
              ),
              Center(
                child: Text(
                  'ENTER YOUR EMAIL AND PASSWORD TO LOGIN',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0, 0, 0),
                    child: Text(
                      'EMAIL',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.mail_outline_rounded),
                          border: const OutlineInputBorder(),
                          hintText: 'name@email.com',
                          hintStyle: Theme.of(context).textTheme.bodyText1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0, 0, 0),
                    child: Text(
                      'PASSWORD',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          border: const OutlineInputBorder(),
                          hintText: 'Password',
                          hintStyle: Theme.of(context).textTheme.bodyText1),
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blue[500],
                            minimumSize: const Size(335.0, 52.0),
                            textStyle: Theme.of(context).textTheme.headline1,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)))),
                        onPressed: () {
                          _buttonAction();
                        }, //TODO login logic
                        child: Center(
                          child: Text('LOGIN',
                              style: Theme.of(context).textTheme.headline5),
                        )),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Haven`t an account yet?',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      TextButton(
                          onPressed: () => Navigator.pushNamed(context, '/login/registration'),
                          child: Text(
                            'Sign Up',
                            style: Theme.of(context).textTheme.bodyText2,
                          ))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
