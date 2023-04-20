import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:utool/user/profileFillingPage.dart';
import 'package:utool/user/profileUpdatePage.dart';

class profileDisplayPage extends StatefulWidget {
  @override
  _profileDisplayPageState createState() => _profileDisplayPageState();
}

class _profileDisplayPageState extends State<profileDisplayPage> {
  String? _name;
  String? _address;
  String? _phoneNumber;

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    // Get the current user
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // Get the user's Firestore document reference
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      DocumentReference userDocRef = users.doc(currentUser.uid);

      // Fetch the user's profile data
      try {
        DocumentSnapshot<Map<String, dynamic>> userProfileSnapshot =
            await userDocRef.get() as DocumentSnapshot<Map<String, dynamic>>;
        Map<String, dynamic> userProfileData = userProfileSnapshot.data()!;
        setState(() {
          _name = userProfileData['name'];
          _address = userProfileData['address'];
          _phoneNumber = userProfileData['phoneNumber']?.toString();
        });
      } catch (error) {
        print('Failed to fetch profile: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileField('Name', _name),
            SizedBox(height: 16.0),
            _buildProfileField('Address', _address),
            SizedBox(height: 16.0),
            _buildProfileField('Phone Number', _phoneNumber),
            Spacer(), // This will push the button to the bottom
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_profileDisplayPageState) =>
                            profileUpdatePage()),
                  );
                },
                child: Text('Update Profile'),
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4.0),
        Text(value ?? 'Not available'),
      ],
    );
  }
}
