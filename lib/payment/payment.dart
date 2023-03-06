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
          Text('total Price: ${item.price}'),
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
