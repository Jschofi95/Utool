import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  _Order createState() => _Order();
}

class _Order extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Order'),
      ),
      body: const Text('Wood Chipper: 02/25/2023'),
      //It should connect to message system. Have no idea yet.
    );
  }
}
