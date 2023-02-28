import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  PaymentPage createState() => PaymentPage();
}

class PaymentPage extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail for the payment'),
      ),
      body: Text('You should pay: ... '),
      //It should connect to message system. Have no idea yet.
    );
  }
}
