import 'package:flutter/material.dart';

class MyBottomAppBar {
  /*
    Method name: bottomppBarLayout
    Parameters: None
    Description: Simple bottom nav bar for homepage. Basically everything is 
    subject to change, this is just a first attempt
    Contributors:
      Dylan Brown
        - Created bottomAppBarLayout
  */

  BottomAppBar bottomAppBarLayout() {
    return BottomAppBar(
      height: 50.0,
      color: const Color.fromARGB(0, 255, 255, 255),
      child: IconTheme(
        data: const IconThemeData(color: Color.fromARGB(255, 10, 29, 136)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
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
                    Icons.account_circle_outlined,
                    color: Colors.white,
                  ),
                  Text("Profile"),
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
            /*
            IconButton(
              color: Colors.white,
              tooltip: 'Lend',
              icon: const Icon(Icons.add_box_rounded),
              onPressed: () {},
            ),
            IconButton(
              color: Colors.white,
              tooltip: 'Rent History',
              icon: const Icon(Icons.auto_stories_rounded),
              onPressed: () {},
            ),
            */
          ],
        ),
      ),
    );
  }
}
