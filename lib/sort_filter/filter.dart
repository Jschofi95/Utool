/*
  Description: filter page for homepage
                need to add functionality and some more filters
  Contributors: Dylan Brown
*/

import 'package:flutter/material.dart';
import 'package:utool/homepage/homepage.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  FilterPage createState() => FilterPage();
}

class FilterPage extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filter Results'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Price
            Container(
                alignment: Alignment.center,
                width: 50.0,
                height: 50.0,
                child: const Text('Price')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 150.0,
                  height: 50.0,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Min Price',
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    width: 50.0,
                    height: 50.0,
                    child: const Text('-')),
                const SizedBox(
                  width: 150.0,
                  height: 50.0,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Max Price',
                    ),
                  ),
                ),
              ],
            ),
            //Distance
            Container(
                alignment: Alignment.center,
                width: 300.0,
                height: 50.0,
                child: const Text('Distance Away (mi.)')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 150.0,
                  height: 50.0,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Min Distance',
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    width: 50.0,
                    height: 50.0,
                    child: const Text('-')),
                const SizedBox(
                  width: 150.0,
                  height: 50.0,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Max Distance',
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

