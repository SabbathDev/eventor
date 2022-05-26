import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Mulish',

  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold), //page top text
    headline2: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold), //field names
    headline3: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold), //event description event name
    headline4: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold), //event description field name
    headline5: TextStyle(fontSize: 13, color: Colors.white),                              //button text
    headline6: TextStyle(fontSize: 16, color: Colors.white60),                            //hint text
    bodyText1: TextStyle(fontSize: 15, color: Colors.grey),                               //main body text
    bodyText2: TextStyle(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),  //link text
  ),
);

ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: Colors.blue,
    secondary: Colors.blue,
  ),

  indicatorColor: Colors.blue,
  fontFamily: 'Mulish',

  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold), //page top text
    headline2: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold), //field names
    headline3: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold), //event description event name
    headline4: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold), //event description field name
    headline5: TextStyle(fontSize: 13, color: Colors.black),                              //button text
    headline6: TextStyle(fontSize: 16, color: Colors.white60),                            //hint text
    bodyText1: TextStyle(fontSize: 15, color: Colors.grey),                               //main body text
    bodyText2: TextStyle(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),  //link text
  ),

  cupertinoOverrideTheme: const CupertinoThemeData(
    brightness: Brightness.dark,
    barBackgroundColor: Color(0x00000000),
    textTheme: CupertinoTextThemeData(
      primaryColor: Colors.white,
    ),
  )
);