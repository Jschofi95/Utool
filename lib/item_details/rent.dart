import 'package:flutter/material.dart';
import 'package:utool/item/item_data.dart';
import 'package:utool/payment/payment.dart';
import 'package:intl/intl.dart';

class Rent extends StatelessWidget {
  final ItemData item;
  Rent({Key? key, required this.item}) : super(key: key);

  final now = DateTime.now();
  //DateTime deliveryDate = now.add(Duration(days: 2));

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rent'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          const Text(
            //detail for the delivery information
            'The Delivery date:',
            style: TextStyle(fontSize: 28, color: Colors.red),
          ),
          Text(
            '${DateFormat('MMMM d, yyyy').format(now)}',
            style: TextStyle(fontSize: 24, color: Colors.red),
          ),
          const Text(
            ' ',
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    //it should go to payment in the end (payment page did not created yet)
                    context,
                    MaterialPageRoute(
                        builder: (_) => Payment(
                              item: item,
                            )));
              },
              child: const Text(
                'Make a payment',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
