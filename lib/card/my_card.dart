import 'package:flutter/material.dart';
import 'package:utool/enums/enums.dart';
import 'package:utool/reviewpage/reviewpage.dart';

class CardData extends StatelessWidget {
  final String type;
  final String imgLink;
  final String brand;
  final String price;
  final Intervals rentPriceInterval;
  final String condition;
  final UseType useType;
  final String address;
  final String deliveryFee;

  const CardData({
    super.key,
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.asset(imgLink),
              title: Text(type),
              subtitle: Text('\$$price ${rentPriceInterval.name}'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Detail'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ReviewPage()));
                  },
                ),

                /*const SizedBox(width: 8),
                TextButton(
                  child: const Text('Message'),
                  onPressed: () {/* ... */},
                ),*/
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
