import 'package:flutter/material.dart';
import 'package:utool/login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
    );
  }
}
