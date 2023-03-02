import 'package:flutter/material.dart';
import 'package:utool/homepage/homepage.dart';
import 'package:utool/init.dart';
import 'package:utool/login/login.dart';
import 'package:utool/splash_screen.dart';

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
            }));
  }
}
