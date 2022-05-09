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
              const Center(
                  child: Text(
                'DISCOVER POPULAR EVENTS & NEARBY FUN',
                style: TextStyle(fontSize: 13.0),
              )),
              const SizedBox(
                height: 100.0,
              ),
              const Center(
                child: Text(
                  'ENTER YOUR EMAIL AND PASSWORD TO LOGIN',
                  style: TextStyle(
                      fontSize: 13.0,
                      fontFamily: 'Mulish',
                      color: Colors.grey
                  ),
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
                      style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Mulish',
                          color: Colors.grey[800]),
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
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Mulish',
                            color: Colors.grey[200],
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0, 0, 0),
                    child: Text(
                      'PASSWORD',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Mulish',
                        color: Colors.grey[800],
                      ),
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
                          hintStyle: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Mulish',
                              color: Colors.grey[200])),
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
                            textStyle: const TextStyle(
                                fontSize: 15.0, fontFamily: 'Mulish'),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)))),
                        onPressed: () {
                          _buttonAction();
                        }, //TODO login logic
                        child: const Center(
                          child: Text('LOGIN'),
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
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Mulish',
                            color: Colors.grey[400]),
                      ),
                      TextButton(
                          onPressed: () => Navigator.pushNamed(context, '/login/registration'),
                          child: const Text(
                            'Sign Up',
                            style:
                                TextStyle(fontSize: 16.0, fontFamily: 'Mulish'),
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
