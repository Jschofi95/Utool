import 'package:flutter/material.dart';
import 'package:utool/homepage/homepage.dart';

/*
  This should display current user data, not ask for user data
*/

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UserProfile();
}

class _UserProfile extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('Display current user data here'),
          ],
        ),
      ),
    );
  }
}
