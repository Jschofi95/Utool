import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountRecoverPage extends StatefulWidget {
  @override
  _AccountRecoverPageState createState() => _AccountRecoverPageState();
}

class _AccountRecoverPageState extends State<AccountRecoverPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restore Account'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(height: 32.0),
              TextButton(
                child: Text('Create Account'),
                onPressed: () {
                  // Add code to create account with _email and _password
                  // You can use Firebase Auth, for example
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
