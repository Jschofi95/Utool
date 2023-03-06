import 'package:flutter/material.dart';
import 'package:utool/homepage/homepage.dart';

class SuccessfulPay extends StatefulWidget {
  const SuccessfulPay({Key? key}) : super(key: key);

  @override
  _SuccessfulPay createState() => _SuccessfulPay();
}

class _SuccessfulPay extends State<SuccessfulPay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('uTool'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          const Text(
            'Thank you !',
            style: TextStyle(fontSize: 28, color: Colors.red),
          ),
          const Text(
            'Your order has been successfully placed.',
            style: TextStyle(fontSize: 20, color: Colors.red),
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
                    MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: const Text(
                'Return home',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
