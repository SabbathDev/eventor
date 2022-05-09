import 'package:flutter/material.dart';
import 'package:eventor/domain/user.dart';
import '../services/AuthService.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key, title}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

  final AuthService _authService = AuthService();


  late String _name;
  late String _email;
  late String _password;

  void _buttonAction() async{
    _name = _nameController.text;
    _email = _emailController.text;
    _password = _passwordController.text;
    if(_password == _repeatPasswordController.text){
      print(_email + "  " + _password + "  " + _name ); //TODO logic for sign in auth
      User user = await _authService.signIn(_name, _email, _password);
    }else{
      print("Error: wrong repeat password"); //TODO error system
    }
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _repeatPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      BackButton()
                    ],
                  ),

                  const SizedBox(
                    height: 30.0,
                  ),
                  Center(
                      child: Text('REGISTRATION',
                        style: Theme.of(context).textTheme.headline1,
                      )
                  ),

                  Padding(
                      padding: const EdgeInsets.fromLTRB(8, 30, 8, 40),
                      child:Column(

                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'NAME',
                              style: Theme.of(context).textTheme.headline2,
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
                              child: TextFormField(
                                controller: _nameController,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.person_outline),
                                    border: const OutlineInputBorder(),
                                    hintText: 'Name',
                                    hintStyle: Theme.of(context).textTheme.bodyText1,
                                  )),
                            ),

                            Text(
                              'EMAIL',
                              style: Theme.of(context).textTheme.headline2,
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
                              child: TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.mail_outline_rounded),
                                    border: const OutlineInputBorder(),
                                    hintText: 'Email',
                                    hintStyle: Theme.of(context).textTheme.bodyText1,
                                    )),
                              ),

                            Text(
                                'PASSWORD',
                                style: Theme.of(context).textTheme.headline2
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
                              child: TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    border: const OutlineInputBorder(),
                                    hintText: 'Password',
                                    hintStyle: Theme.of(context).textTheme.bodyText1
                                ),
                              ),
                            ),

                            Text(
                                'REPEAT PASSWORD',
                                style: Theme.of(context).textTheme.headline2
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                              child: TextFormField(
                                controller: _repeatPasswordController,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    border: const OutlineInputBorder(),
                                    hintText: 'Password',
                                    hintStyle: Theme.of(context).textTheme.bodyText1
                                ),
                              ),
                            ),
                          ],
                        ),
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
                              BorderRadius.all(Radius.circular(50.0))
                          )
                      ),
                      onPressed: () => _buttonAction(),
                      child: Text(
                        'SIGN UP',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Back to',
                          style: Theme.of(context).textTheme.bodyText1
                      ),
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                              'Login',
                              style: Theme.of(context).textTheme.bodyText2
                          )
                      )
                    ],
                  )
                ]
            )
        ),
      )
    );
  }
}