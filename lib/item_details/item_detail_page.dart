import 'package:flutter/material.dart';
import 'package:utool/item/item_data.dart';
import 'package:utool/card/card_layout.dart';
import 'package:utool/message/message.dart';
import 'package:utool/userprofile/userprofile.dart';
import 'rent.dart';
//import 'payment.dart';

class ItemDetails extends StatelessWidget {
  final ItemData item; // Data for item to be displayed

  const ItemDetails({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: SafeArea(
        child: Column(
          children: const <Widget>[
            Text("Place holder data"),
          ],
        ),
      ),
    );
  }
}
