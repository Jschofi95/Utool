// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:utool/homepage/homepage.dart';
import 'package:utool/item/item_data.dart';

class SuccessfulPost extends StatelessWidget {
  final Map<String, dynamic> item;

  const SuccessfulPost({Key? key, required this.item}) : super(key: key);

  TextStyle defaultHintStyle() {
    return TextStyle(
        color: Colors.white.withOpacity(0.5),
        fontWeight: FontWeight.bold,
        fontSize: 12.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          //width: double.infinity,
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Type: ${item['type']}",
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text("Brand: ${item['brand']}"),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text("Price: ${item['price']}"),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text("Rent Interval: ${item['rentPriceInterval']}"),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text("Condition: ${item['condition']}"),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text("Use type: ${item['useType']}"),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text("Address line 1: ${item['addressLine1']}"),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text("Address line 2: ${item['addressLine2']}"),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text("City: ${item['city']}"),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text("State: ${item['state']}"),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text("Zip code: ${item['zipCode']}"),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text("Delivery Fee: ${item['deliveryFee']}"),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text("Hours: ${item['hours']}"),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text("Description: ${item['description']}"),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 8.0),
                alignment: Alignment.center,
                child: Text(
                  "Is this information correct?",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 4.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Submit'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 4.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Edit'),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}








