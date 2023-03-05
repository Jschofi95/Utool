import 'package:flutter/material.dart';
import 'package:utool/item/item_data.dart';

class Payment extends StatelessWidget {
  final ItemData item;
  const Payment({Key? key, required this.item}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail for the payment'),
      ),
      body: Text('total Price: ${item.price}'),

      //It should connect to message system. Have no idea yet.
    );
  }  
}

