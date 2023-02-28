import 'package:flutter/material.dart';
import 'package:utool/message/message.dart';
import 'rent.dart';
//import 'payment.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Center(
          child: Column(
        children: const <Widget>[
          //picture still need to fix, cannot shw up
          //Image.asset('picture/p1.jpg'),

          Text(
            'The example here is home depo',
            style: TextStyle(fontSize: 28, color: Colors.red),
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Rent',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Message()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Rent()),
            );
          }
        },
      ),
    );
  }
}
