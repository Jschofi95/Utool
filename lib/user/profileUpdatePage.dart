import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:utool/user/profileDisplayPage.dart';

class profileUpdatePage extends StatefulWidget {
  @override
  _profileUpdatePageState createState() => _profileUpdatePageState();
}

class _profileUpdatePageState extends State<profileUpdatePage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _address = '';
  String _phoneNumber = '';
  String _state = '';
  String _city = '';
  String _zipCode = '';

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
        'state': _state,
        'city': _city,
        'zipCode': _zipCode,
      }, SetOptions(merge: true)).catchError((error) {
        print('Failed to save profile: $error');
      });
    }
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
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    LengthLimitingTextInputFormatter(10),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (value.length < 10) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _phoneNumber = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'State'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your state';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _state = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'City'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _city = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Zip Code'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    LengthLimitingTextInputFormatter(5),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your zip code';
                    } else if (value.length != 5) {
                      return 'Please enter a valid 5-digit zip code';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _zipCode = value;
                    });
                  },
                ),
                SizedBox(height: 32.0),
                TextButton(
                  child: Text('Update Profile'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await saveProfileToFirestore();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => profileDisplayPage()));
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
