import 'package:utool/enums/enums.dart';

class ItemData {
  final String type;
  final String imgLink;
  final String brand;
  final String price;
  final Intervals rentPriceInterval;
  final String condition;
  final UseType useType;
  final String address;
  final String deliveryFee;

  const ItemData({
    required this.type,
    required this.imgLink,
    required this.brand,
    required this.price,
    required this.rentPriceInterval,
    required this.condition,
    required this.useType,
    required this.address,
    required this.deliveryFee,
  });
}
