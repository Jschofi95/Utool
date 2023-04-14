import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class profileFillingPage extends StatefulWidget {
  @override
  _profileFillingPageState createState() => _profileFillingPageState();
}

class _profileFillingPageState extends State<profileFillingPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _address = '';
  String _phoneNumber = '';

  Future<void> saveProfileToFirestore() async {
    // Get the current user
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // Get the user's Firestore document reference
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      DocumentReference userDocRef = users.doc(currentUser.uid);

      // Save the user's profile data
      return userDocRef.set({
        'name': _name,
        'address': _address,
        'phoneNumber': _phoneNumber,
      }, SetOptions(merge: true)).catchError((error) {
        print('Failed to save profile: $error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complete Your Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _address = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _phoneNumber = value;
                    });
                  },
                ),
                SizedBox(height: 32.0),
                TextButton(
                  child: Text('Save Profile'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await saveProfileToFirestore();
                      // Navigate to the next page, if needed
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
