import 'package:utool/enums/enums.dart';

/*
    Class name: ItemData
    Parameters: None
    Description: Holds all data and methods for an individual item.
    Contributors:
      Aaron Schofield
        - Created ItemData with a few basic variables
  */

class ItemData {
  String id; // Unique Id for this item, once an id is used, it can never be used again
  String type;
  List<String> imgLinks;
  String brand;
  String model;
  double price;
  Intervals rentPriceInterval;
  String condition;
  UseType useType;
  String addressLine1;
  String addressLine2;
  String city;
  String state;
  int zipCode;
  double deliveryFee;
  double hours;
  String description;

  ItemData({
    required this.id,
    required this.type,
    required this.imgLinks,
    required this.brand,
    required this.model,
    required this.price,
    required this.rentPriceInterval,
    required this.condition,
    required this.useType,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.deliveryFee,
    required this.hours,
    required this.description,
  });
}
