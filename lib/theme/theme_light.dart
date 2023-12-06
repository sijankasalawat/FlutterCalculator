import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(255, 0, 0, 0),
    secondary: Color.fromARGB(255, 45, 45, 45),
    background: Color.fromARGB(255, 252, 252, 252),
    onBackground: Color.fromRGBO(144, 202, 249, 1),
  ),
);
