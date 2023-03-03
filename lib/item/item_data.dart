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
  final String type;
  final List <String> imgLinks;
  final String brand;
  final String price;
  final Intervals rentPriceInterval;
  final String condition;
  final UseType useType;
  final String address;
  final String deliveryFee;

  const ItemData({
    required this.type,
    required this.imgLinks,
    required this.brand,
    required this.price,
    required this.rentPriceInterval,
    required this.condition,
    required this.useType,
    required this.address,
    required this.deliveryFee,
  });
}
