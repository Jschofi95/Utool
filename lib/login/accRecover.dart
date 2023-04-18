import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountRecoverPage extends StatefulWidget {
  @override
  _AccountRecoverPageState createState() => _AccountRecoverPageState();
}

class _AccountRecoverPageState extends State<AccountRecoverPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';

  Future<void> _recoverAccount() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('A password reset link has been sent to your email.'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again.'),
        ),
      );
      print(e);
    }
  }

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
              TextButton(
                child: Text('Recover Account'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _recoverAccount();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
