// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:utool/homepage/homepage.dart';
import 'package:utool/item/item_data.dart';
import 'successfulpost.dart';
import 'package:utool/enums/enums.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Post();
}

class _Post extends State<Post> {
  final idController = TextEditingController();
  final typeController = TextEditingController();
  final brandController = TextEditingController();
  final modelController = TextEditingController();
  final priceController = TextEditingController();
  final rentPriceIntervalController = TextEditingController();
  final conditionController = TextEditingController();
  final useTypeController = TextEditingController();
  final addressLine1Controller = TextEditingController();
  final addressLine2Controller = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();
  final deliveryFeeController = TextEditingController();
  final hoursController = TextEditingController();
  final descriptionController = TextEditingController();
  final imgLinksController = TextEditingController();

  Map<String, dynamic> item = {
    'id': '1b',
    'type': '',
    'brand': '',
    'model': '',
    'price': 0.0,
    'rentPriceInterval': '',
    'condition': '',
    'useType': '',
    'addressLine1': '',
    'addressLine2': '',
    'city': '',
    'state': '',
    'zipCode': 0,
    'deliveryFee': 0.0,
    'hours': 0.0,
    'description': '',
    'imgLinks': ['assets/woodchipper_placeholder.png'],
  };

  void buildItem() {
    item['type'] = typeController.text;
    item['brand'] = brandController.text;
    item['model'] = modelController.text;
    item['price'] = dynToDouble(priceController.text);
    item['rentPriceInterval'] = rentPriceIntervalController.text;
    item['condition'] = conditionController.text;
    item['useType'] = useTypeController.text;
    item['addressLine1'] = addressLine1Controller.text;
    item['addressLine2'] = addressLine2Controller.text;
    item['city'] = cityController.text;
    item['state'] = stateController.text;
    item['zipCode'] = dynToDouble(zipCodeController.text);
    item['deliveryFee'] = dynToDouble(deliveryFeeController.text);
    item['hours'] = dynToDouble(hoursController.text);
    item['description'] = descriptionController.text;
    item['imgLinks'] = imgLinksController.text;
  }

  // Dynamic to double
  double dynToDouble(String data) {
    double price;
    if (double.tryParse(data) != null) {
      price = double.parse(data);
    } else {
      // Handle the case where the price is not a valid numeric value
      // For example, you can set the price to a default value or show an error message
      price = 0.0;
    }
    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New post'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              //type
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: typeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tool Type',
                    hintText: 'Enter type'),
              ),
            ),

            //imageLink
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 10),
            //   child: TextField(
            //     controller: imageController,
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: 'ImageLink',
            //         hintText: 'Enter image'),
            //   ),
            // ),

            //brand
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: brandController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Brand',
                    hintText: 'Enter brand'),
              ),
            ),

            //price
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: priceController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Price',
                    hintText: 'Enter price // per day'),
              ),
            ),

            //rentPriceInterval
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: rentPriceIntervalController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Rent Price Interval',
                    hintText: 'Enter price Interval'),
              ),
            ),

            //condition
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: conditionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Condition',
                    hintText: 'Enter % of new'),
              ),
            ),

            //useType
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: useTypeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Use Type',
                    hintText: 'Enter use type'),
              ),
            ),

            //address
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: addressLine1Controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address line 1',
                    hintText: 'Enter address'),
              ),
            ),

            //address2
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: addressLine2Controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address line 2',
                    hintText: 'Enter address'),
              ),
            ),
            //city
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: cityController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'City',
                    hintText: 'Enter City'),
              ),
            ),

            //state
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: stateController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'State',
                    hintText: 'Enter State'),
              ),
            ),

            //zipCode
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: zipCodeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Zip Code',
                    hintText: 'Enter zip code'),
              ),
            ),

            //deliveryFee
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: deliveryFeeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Would you pay deliveryFee',
                    hintText: 'Enter Y for yes, N for no'),
              ),
            ),

            //hours
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: hoursController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'How long would you like to rent',
                    hintText: 'Enter time'),
              ),
            ),

            //description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Discription',
                    hintText: 'Enter discription'),
              ),
            ),

            TextButton(
              onPressed: () {
                buildItem();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SuccessfulPost(
                      item: item,
                    ),
                  ),
                );
              },
              child: const Text(
                'Post',
                style: TextStyle(color: Colors.red, fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
