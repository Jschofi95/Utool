import 'package:flutter/material.dart';
import 'package:utool/homepage/homepage.dart';
import 'package:utool/init.dart';
import 'package:utool/login/login.dart';
import 'package:utool/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart'; //
//import 'firebase_options.dart'; // Generated file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future _initFuture = Init.initialize();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Initialization',
      home: FutureBuilder(
        future: _initFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginPage();
          } else {
            return SplashScreen();
          }
        },
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        fontFamily: 'Helvelica',
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0),
          bodyMedium: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
