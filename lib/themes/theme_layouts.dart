import 'package:flutter/material.dart';

ThemeData darkTheme1() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    fontFamily: 'Helvelica',
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 36.0),
      bodyMedium: TextStyle(fontSize: 18.0),
    ),
  );
}

ThemeData lightTheme1() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    fontFamily: 'Helvelica',
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 36.0),
      bodyMedium: TextStyle(fontSize: 18.0),
    ),
  );
}
