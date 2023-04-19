// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:utool/user/user_data.dart';

class profileFillingPage extends StatefulWidget {
  @override
  _profileFillingPageState createState() => _profileFillingPageState();
}

class _profileFillingPageState extends State<profileFillingPage> {
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final streetAddress1Controller = TextEditingController();
  final streetAddress2Controller = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipController = TextEditingController();
  final userNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late UserData userData;
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

  SingleChildScrollView inputList() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              // Username
              controller: userNameController,
              decoration: InputDecoration(
                labelText: 'Create a User Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              // First Name
              controller: firstNameController,
              decoration: InputDecoration(
                labelText: 'Enter First Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              // Middle name (This line is optional, so it can be left empty)
              controller: middleNameController,
              decoration: InputDecoration(
                labelText: 'Enter Middle Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              // Last name
              controller: lastNameController,
              decoration: InputDecoration(
                labelText: 'Enter Last Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: inputList(),
          // child: SingleChildScrollView(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     children: [
          //       TextFormField(
          //         decoration: InputDecoration(labelText: 'Name'),
          //         validator: (value) {
          //           if (value!.isEmpty) {
          //             return 'Please enter your name';
          //           }
          //           return null;
          //         },
          //         onChanged: (value) {
          //           setState(() {
          //             _name = value;
          //           });
          //         },
          //       ),
          //       SizedBox(height: 16.0),
          //       TextFormField(
          //         decoration: InputDecoration(labelText: 'Address'),
          //         validator: (value) {
          //           if (value!.isEmpty) {
          //             return 'Please enter your address';
          //           }
          //           return null;
          //         },
          //         onChanged: (value) {
          //           setState(() {
          //             _address = value;
          //           });
          //         },
          //       ),
          //       SizedBox(height: 16.0),
          //       TextFormField(
          //         decoration: InputDecoration(labelText: 'Phone Number'),
          //         keyboardType: TextInputType.phone,
          //         inputFormatters: [
          //           FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          //           LengthLimitingTextInputFormatter(10),
          //         ],
          //         validator: (value) {
          //           if (value!.isEmpty) {
          //             return 'Please enter your phone number';
          //           } else if (value.length < 10) {
          //             return 'Please enter a valid 10-digit phone number';
          //           }
          //           return null;
          //         },
          //         onChanged: (value) {
          //           setState(() {
          //             _phoneNumber = value;
          //           });
          //         },
          //       ),
          //       SizedBox(height: 32.0),
          //       TextButton(
          //         child: Text('Save Profile'),
          //         onPressed: () async {
          //           if (_formKey.currentState!.validate()) {
          //             await saveProfileToFirestore();
          //             // Navigate to the next page, if needed
          //           }
          //         },
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
