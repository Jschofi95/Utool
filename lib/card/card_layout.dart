import 'package:flutter/material.dart';
import 'package:utool/item/item_data.dart';
import 'package:utool/enums/enums.dart';
import 'package:utool/item_details/item_detail_page.dart';

class CardLayout extends StatelessWidget {
  final ItemData itemData;
  const CardLayout({
    super.key,
    required this.itemData,
  });

  String tryGetImageLink() {
    if (itemData.imgLinks.isEmpty) {
      return 'assets/no_image.png';
    }

    return itemData.imgLinks;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.asset(tryGetImageLink()),
              title: Text(itemData.type),
              subtitle: Text(
                  '\$${itemData.price} ${itemData.rentPriceInterval.name}'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Detail'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ItemDetails(
                          item: itemData,
                        ),
                      ),
                    );
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
