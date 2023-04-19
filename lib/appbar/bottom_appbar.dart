import 'package:flutter/material.dart';
import 'package:utool/user/ProfilefillingPage.dart';
import 'package:utool/user/user_profile.dart';
import 'package:utool/order/order.dart';

class MyBottomAppBar extends StatelessWidget {
  /*
    Method name: bottomppBarLayout
    Parameters: None
    Description: Simple bottom nav bar for homepage. Basically everything is 
    subject to change, this is just a first attempt
    Contributors:
      Dylan Brown
        - Created bottomAppBarLayout
  */

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomAppBar(
      height: 50.0,
      color: const Color.fromARGB(0, 255, 255, 255),
      child: IconTheme(
        data: const IconThemeData(color: Color.fromARGB(255, 10, 29, 136)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      // MaterialPageRoute(builder: (_) => UserProfile()));
                      MaterialPageRoute(builder: (_) => profileFillingPage()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    textStyle: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold)),
                child: Column(children: const [
                  Icon(
                    Icons.account_circle_outlined,
                    color: Colors.white,
                  ),
                  Text("Profile"),
                ])),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Order()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    textStyle: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold)),
                child: Column(children: const [
                  Icon(
                    Icons.add_box_rounded,
                    color: Colors.white,
                  ),
                  Text("Lend"),
                ])),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    textStyle: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold)),
                child: Column(children: const [
                  Icon(
                    Icons.auto_stories_rounded,
                    color: Colors.white,
                  ),
                  Text("History"),
                ])),

            // IconButton(
            //   color: Colors.white,
            //   tooltip: 'Lend',
            //   icon: const Icon(Icons.add_box_rounded),
            //   onPressed: () {
            //     Navigator.push(context, route)
            //   },
            // ),
            // IconButton(
            //   color: Colors.white,
            //   tooltip: 'Rent History',
            //   icon: const Icon(Icons.auto_stories_rounded),
            //   onPressed: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
