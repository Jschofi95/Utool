import 'package:flutter/material.dart';
import 'package:utool/homepage/homepage.dart';
import 'package:utool/init.dart';
import 'package:utool/login/login.dart';
import 'package:utool/splash_screen.dart';
import 'package:utool/themes/theme_layouts.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

/*
void main() {
  runApp(MyApp());
}
*/
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
            // return LoginPage();
            return HomePage();
          } else {
            return SplashScreen();
          }
        },
      ),
      theme: darkTheme1(),
    );
  }
}
