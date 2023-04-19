// ignore_for_file: public_member_api_docs, sort_constructors_first
/* 
  Class name: User
  Parameters: None
  Description: Class to hold data for a user
  Contributors: Aaron Schofield
*/
import 'package:utool/item/item_data.dart';

class UserData {
  int id; // Unique id for this user.
  String firstName;
  String middleName;
  String lastName;
  String addressLine1;
  String addressLine2;
  String country;
  String city;
  String state; // Full state name
  int zipCode;
  double rating; // 0-5 scale rating number
  String username;


  List<String> listings; // All item IDs for listings posted by this user
  List<String> history; // History of all item IDs for listings viewed by this user
  List<String> favorites; // List of all item IDs favorited listings by this user
  
  UserData({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.addressLine1,
    required this.addressLine2,
    required this.country,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.rating,
    required this.username,
    required this.listings,
    required this.history,
    required this.favorites,
  });


}
