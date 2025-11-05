import 'package:flutter/material.dart';

final Color darkGreen = Color(0xFF405436);
final Color gold = Color(0xFFEDC949);
final Color lime = Color(0xFFA9BE70);
final Color correctGreen = Color(0xFF34C759);
final Color wrongRed = Color(0xFFFF383C);

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: darkGreen,
  fontFamily: 'Rubik',
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
  ),
);
