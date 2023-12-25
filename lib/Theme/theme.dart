import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  bottomAppBarColor: Colors.blue,
  hintColor: Colors.black,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
  ),
  focusColor: Colors.blue
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  hintColor: Colors.black,
  backgroundColor: Colors.black,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
    ),
    focusColor: Colors.white38
);
