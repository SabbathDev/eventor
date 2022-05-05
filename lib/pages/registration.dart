import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key, title}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    BackButton( //TODO navigate back to login page

                    )
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
                            child: TextField(
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
                            child: TextField(
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
                    onPressed: () {}, //TODO registration logic

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
                        onPressed: () {}, //TODO navigate back to login page
                        child: Text(
                            'Login',
                            style: Theme.of(context).textTheme.bodyText2
                        )
                    )
                  ],
                )
              ]
          )
      )
    );
  }
}