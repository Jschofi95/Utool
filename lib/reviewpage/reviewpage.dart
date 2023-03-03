import 'package:flutter/material.dart';
import 'package:utool/message/message.dart';
import 'package:utool/userprofile/userprofile.dart';
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
            'wood chipper 3 in. 7 HP Gas Powered Kohler Engine Direct Drive Certified Commercial Chipper Shredder with Trailer Tow Hitch',
            style: TextStyle(fontSize: 14, color: Colors.red),
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Rent',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserProfile()),
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
