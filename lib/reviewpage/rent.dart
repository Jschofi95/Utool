import 'package:flutter/material.dart';
import 'package:utool/payment/payment.dart';

class Rent extends StatefulWidget {
  const Rent({Key? key}) : super(key: key);

  @override
  RentPage createState() => RentPage();
}

class RentPage extends State<Rent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rent'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          const Text(
            //detail for the delivery information
            'The Delivery date',
            style: TextStyle(fontSize: 28, color: Colors.red),
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
                    MaterialPageRoute(builder: (_) => Payment()));
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
