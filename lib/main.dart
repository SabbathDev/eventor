import 'package:eventor/pages/login.dart';
import 'package:eventor/pages/registration.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        fontFamily: 'Mulish',

        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold), //page top text
          headline2: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),                      //field names
          headline5: TextStyle(fontSize: 13, color: Colors.white),                              //button text
          headline6: TextStyle(fontSize: 16, color: Colors.white60),                            //hint text
          bodyText1: TextStyle(fontSize: 15, color: Colors.grey),                               //main body text
          bodyText2: TextStyle(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),  //link text
        ),
      ),

      darkTheme: ThemeData.dark(),

      home: const Login(),
  ));
}
