import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Mulish',

  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold), //page top text
    headline2: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),                      //field names
    headline5: TextStyle(fontSize: 13, color: Colors.white),                              //button text
    headline6: TextStyle(fontSize: 16, color: Colors.white60),                            //hint text
    bodyText1: TextStyle(fontSize: 15, color: Colors.grey),                               //main body text
    bodyText2: TextStyle(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),  //link text
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Mulish',

  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold), //page top text
    headline2: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),                      //field names
    headline5: TextStyle(fontSize: 13, color: Colors.black),                              //button text
    headline6: TextStyle(fontSize: 16, color: Colors.white60),                            //hint text
    bodyText1: TextStyle(fontSize: 15, color: Colors.grey),                               //main body text
    bodyText2: TextStyle(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),  //link text
  ),
);