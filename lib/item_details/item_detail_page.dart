import 'package:flutter/material.dart';
import 'package:utool/item/item_data.dart';

class ItemDetails extends StatelessWidget {
  final ItemData item; // Data for item to be displayed

  const ItemDetails({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Details'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                  size: 30,
                ))
          ],
        ),
        body: Column(
          children: <Widget>[
            Text(item.type),
          ],
        ),
      ),
    );
  }
}
