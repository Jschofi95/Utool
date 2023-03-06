import 'package:flutter/material.dart';
import 'package:utool/item/item_data.dart';
import 'successfulpay.dart';

class Payment extends StatelessWidget {
  final ItemData item;
  const Payment({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Detail'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Text(
            'Rent Price: ${int.parse(item.price)}',
            style: const TextStyle(fontSize: 28, color: Colors.red),
          ),
          //10% for tax price
          Text(
            'Tax Price: ${0.1 * int.parse(item.price)}',
            style: const TextStyle(fontSize: 28, color: Colors.red),
          ),
          Text(
            'Total Price: ${1.1 * int.parse(item.price)}',
            style: const TextStyle(fontSize: 28, color: Colors.red),
          ),
          //add a empty line
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => SuccessfulPay()));
              },
              child: const Text(
                'Pay',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      )),

      //It should connect to message system. Have no idea yet.
    );
  }
}
