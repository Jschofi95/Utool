// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:utool/homepage/homepage.dart';
import 'package:utool/item/item_data.dart';
import 'post_review.dart';
import 'package:utool/enums/enums.dart';

/* 
  TODO
  - Add more format checks to input
  - Add drop down boxes instead of raw text input to useType and interval boxes (user should only be able to choose options from the enums file)
  - Make it so delivery fee box only shows up if the user chose delivery as an option
  - Find more stuff to fix
*/

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
  late var rentPriceIntervalController = TextEditingController();
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
    'rentPriceInterval': 'HOURLY',
    'condition': '',
    'useType': 'DELIVERY',
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
    //item['rentPriceInterval'] = rentPriceIntervalController.text;
    item['condition'] = conditionController.text;
    //item['useType'] = useTypeController.text;
    item['addressLine1'] = addressLine1Controller.text;
    item['addressLine2'] = addressLine2Controller.text;
    item['city'] = cityController.text;
    //item['state'] = stateController.text;
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

  // Check that a string only contains letters and or numbers
  bool containsOnlyLettersAndNumbers(String str) {
    final RegExp regex = RegExp(r'^[a-zA-Z0-9 ]+$');
    return regex.hasMatch(str);
  }

  bool containsOnlyCharacters(String str) {
    final RegExp regex = RegExp(r'^[a-zA-Z]+$');
    return regex.hasMatch(str);
  }

  bool containsOnlyNumbers(String str) {
    final numberRegex = RegExp(r'^-?[0-9]+([.][0-9]+)?$');
    return numberRegex.hasMatch(str);
  }

  /*bool isCorrectRentPriceInterval(String str) {
    if (str == 'HOURLY' ||
        str == 'DAILY' ||
        str == 'WEEKLY' ||
        str == 'MONTHLY') return true;
    return false;
  }

  bool isCorrectUseType(String str) {
    if (str == 'DELIVERY' || str == 'PICK_UP' || str == 'STORE_USE_ONLY')
      return true;
    return false;
  }

  bool isCorrectState(String str) {
    if (str == 'AL' || str == 'AK' || str == 'AZ' || str == 'AR' || str == 'CA'
      || str == 'CO' || str == 'CT' || str == 'DE' || str == 'DC' || str == 'FL'
      || str == 'GA' || str == 'HI' || str == 'ID' || str == 'IL' || str == 'IN'
      || str == 'IA' || str == 'KS' || str == 'KY' || str == 'LA' || str == 'ME'
      || str == 'MD' || str == 'MA' || str == 'MI' || str == 'MN' || str == 'MS'
      || str == 'MO' || str == 'MT' || str == 'NE' || str == 'NV' || str == 'NH'
      || str == 'NJ' || str == 'NM' || str == 'NY' || str == 'NC' || str == 'ND'
      || str == 'OH' || str == 'OK' || str == 'OR' || str == 'PA' || str == 'PR'
      || str == 'RI' || str == 'SC' || str == 'SD' || str == 'TN' || str == 'TX'
      || str == 'UT' || str == 'VT' || str == 'VA' || str == 'VI' || str == 'WA'
      || str == 'WV' || str == 'WI' || str == 'WY') return true;
    return false;
  }*/

  // Check that all fields contain valid input
  int checkIfAllFieldsValid() {
    // Check tool type
    if (typeController.text.isEmpty ||
        !containsOnlyLettersAndNumbers(typeController.text)) {
      print('Type is incorrect format');
      return 1;
    } else if (brandController.text.isEmpty ||
        !containsOnlyCharacters(brandController.text)) {
      print('Brand is incorrect format');
      return 2;
    } else if (modelController.text.isEmpty ||
        !containsOnlyLettersAndNumbers(modelController.text)) {
      print('Model is incorrect format');
      return 2;
    } else if (priceController.text.isEmpty ||
        !containsOnlyNumbers(priceController.text)) {
      print('Price is incorrect format');
      return 3;
    } /*else if (rentPriceIntervalController.text.isEmpty ||
        !isCorrectRentPriceInterval(rentPriceIntervalController.text)) {
      print(' rentPriceInterval is incorrect format');
      return 4;
    } */
    else if (conditionController.text.isEmpty ||
        !containsOnlyCharacters(conditionController.text)) {
      print('Condition is incorrect format');
      return 5;
    } /*else if (useTypeController.text.isEmpty ||
        !isCorrectUseType(useTypeController.text)) {
      print('useType is incorrect format');
      return 6;
    }*/
    else if (addressLine1Controller.text.isEmpty ||
        !containsOnlyLettersAndNumbers(addressLine1Controller.text)) {
      print('Address Line 1 incorrect format');
      return 7;
    } else if (addressLine2Controller.text.isNotEmpty &&
        !containsOnlyLettersAndNumbers(addressLine2Controller.text)) {
      print('Address line 2 is incorrect format');
      return 8;
    } else if (cityController.text.isEmpty ||
        !containsOnlyCharacters(cityController.text)) {
      print('City controller is incorrect format');
      return 9;
    } /*else if (stateController.text.isEmpty ||
        !containsOnlyCharacters(stateController.text)) {
      print('State is incorrect format');
      return 10;
    }*/
    else if (zipCodeController.text.isEmpty ||
        !containsOnlyNumbers(zipCodeController.text)) {
      print('zipCode is incorrect format');
      return 11;
    } /*else if (deliveryFeeController.text.isEmpty ||
        !containsOnlyNumbers(deliveryFeeController.text)) {
      print('Delivery fee is incorrect format');
      return 12;
    }*/
    else if (hoursController.text.isEmpty ||
        !containsOnlyNumbers(hoursController.text)) {
      print('Hours is incorrect format');
      return 13;
    } else if (descriptionController.text.isEmpty ||
        !containsOnlyLettersAndNumbers(descriptionController.text)) {
      print('Description is incorrect format');
      return 14;
    }
    return 0;
  }

  bool showDeliveryFeeField = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New post'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //TYPE
            Text(
              'Tool Type',
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: typeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    //labelText: 'Tool Type',
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
            //Brand
            Text(
              'Brand',
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: brandController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter brand'),
              ),
            ),
            //Model
            Text(
              'Model',
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: modelController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Model'),
              ),
            ),

            //price
            Text(
              'Price',
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: priceController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter price'),
              ),
            ),

            //rentPriceInterval
            /*Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: rentPriceIntervalController,

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Rent Price Interval',
                    hintText: 'Enter price Interval'
                ),


              ),
            ),*/
            //price interval
            Text(
              'Price Interval',
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButtonFormField<String>(
                items: [
                  DropdownMenuItem(
                    value: 'HOURLY',
                    child: Text('Hourly'),
                  ),
                  DropdownMenuItem(
                    value: 'DAILY',
                    child: Text('Daily'),
                  ),
                  DropdownMenuItem(
                    value: 'WEEKLY',
                    child: Text('Weekly'),
                  ),
                  DropdownMenuItem(
                    value: 'MONTHLY',
                    child: Text('Monthly'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    item['rentPriceInterval'] = value!;
                  });
                },
              ),
            ),

            //condition
            Text(
              'Condition',
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: conditionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Condition'),
              ),
            ),

            //UseType
            Text(
              'UseType',
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButtonFormField<String>(
                items: [
                  DropdownMenuItem(
                    value: 'DELIVERY',
                    child: Text('Delivery'),
                  ),
                  DropdownMenuItem(
                    value: 'PICK_UP',
                    child: Text('Pick up'),
                  ),
                  DropdownMenuItem(
                    value: 'STORE_USE_ONLY',
                    child: Text('store use only'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    item['useType'] = value!;
                    showDeliveryFeeField = (value == 'DELIVERY');
                  });
                },
              ),
            ),

            //useType
            /* Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: useTypeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Use Type',
                    hintText: 'Enter use type'),
              ),
            ),*/

            //deliveryFee
            if (showDeliveryFeeField)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: deliveryFeeController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Delivery Fee',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

            /* Text(
              'Delivery Fee',
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: deliveryFeeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Delivery Fee',
                    hintText: 'Enter number'),
              ),
            ),*/

            //address1
            Text(
              'Address 1',
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: addressLine1Controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter address'),
              ),
            ),
            //address2
            Text(
              'Address 2',
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: addressLine2Controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter address OPTIONAL'),
              ),
            ),
            //city
            Text(
              'City',
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: cityController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter City'),
              ),
            ),

            //States
            Text(
              'State',
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButtonFormField<String>(
                items: [
                  DropdownMenuItem(
                    value: 'AL',
                    child: Text('Alabama'),
                  ),
                  DropdownMenuItem(
                    value: 'AK',
                    child: Text('Alaska'),
                  ),
                  DropdownMenuItem(
                    value: 'AZ',
                    child: Text('Arizona'),
                  ),
                  DropdownMenuItem(
                    value: 'AR',
                    child: Text('Arkansas'),
                  ),
                  DropdownMenuItem(
                    value: 'CA',
                    child: Text('California'),
                  ),
                  DropdownMenuItem(
                    value: 'CO',
                    child: Text('Colorado'),
                  ),
                  DropdownMenuItem(
                    value: 'CT',
                    child: Text('Connecticut'),
                  ),
                  DropdownMenuItem(
                    value: 'DE',
                    child: Text('Delaware'),
                  ),
                  DropdownMenuItem(
                    value: 'DC',
                    child: Text('District of Columbia'),
                  ),
                  DropdownMenuItem(
                    value: 'FL',
                    child: Text('Florida'),
                  ),
                  DropdownMenuItem(
                    value: 'GA',
                    child: Text('Georgia'),
                  ),
                  DropdownMenuItem(
                    value: 'HI',
                    child: Text('Hawaii'),
                  ),
                  DropdownMenuItem(
                    value: 'ID',
                    child: Text('Idaho'),
                  ),
                  DropdownMenuItem(
                    value: 'IL',
                    child: Text('Illinois'),
                  ),
                  DropdownMenuItem(
                    value: 'IN',
                    child: Text('Indiana'),
                  ),
                  DropdownMenuItem(
                    value: 'IA',
                    child: Text('Iowa'),
                  ),
                  DropdownMenuItem(
                    value: 'KS',
                    child: Text('Kansas'),
                  ),
                  DropdownMenuItem(
                    value: 'KY',
                    child: Text('Kentucky'),
                  ),
                  DropdownMenuItem(
                    value: 'LA',
                    child: Text('Louisiana'),
                  ),
                  DropdownMenuItem(
                    value: 'ME',
                    child: Text('Maine'),
                  ),
                  DropdownMenuItem(
                    value: 'MD',
                    child: Text('Maryland'),
                  ),
                  DropdownMenuItem(
                    value: 'MA',
                    child: Text('Massachusetts'),
                  ),
                  DropdownMenuItem(
                    value: 'MI',
                    child: Text('Michigan'),
                  ),
                  DropdownMenuItem(
                    value: 'MN',
                    child: Text('Minnesota'),
                  ),
                  DropdownMenuItem(
                    value: 'MS',
                    child: Text('Mississippi'),
                  ),
                  DropdownMenuItem(
                    value: 'MO',
                    child: Text('Missouri'),
                  ),
                  DropdownMenuItem(
                    value: 'MT',
                    child: Text('Montana'),
                  ),
                  DropdownMenuItem(
                    value: 'NE',
                    child: Text('Nebraska'),
                  ),
                  DropdownMenuItem(
                    value: 'NV',
                    child: Text('Nevada'),
                  ),
                  DropdownMenuItem(
                    value: 'NH',
                    child: Text('New Hampshire'),
                  ),
                  DropdownMenuItem(
                    value: 'NJ',
                    child: Text('New Jersey'),
                  ),
                  DropdownMenuItem(
                    value: 'NM',
                    child: Text('New Mexico'),
                  ),
                  DropdownMenuItem(
                    value: 'NY',
                    child: Text('New York'),
                  ),
                  DropdownMenuItem(
                    value: 'NC',
                    child: Text('North Carolina'),
                  ),
                  DropdownMenuItem(
                    value: 'ND',
                    child: Text('North Dakota'),
                  ),
                  DropdownMenuItem(
                    value: 'OH',
                    child: Text('Ohio'),
                  ),
                  DropdownMenuItem(
                    value: 'OK',
                    child: Text('Oklahoma'),
                  ),
                  DropdownMenuItem(
                    value: 'OR',
                    child: Text('Oregon'),
                  ),
                  DropdownMenuItem(
                    value: 'PA',
                    child: Text('Pennsylvania'),
                  ),
                  DropdownMenuItem(
                    value: 'PR',
                    child: Text('Puerto Rico'),
                  ),
                  DropdownMenuItem(
                    value: 'RI',
                    child: Text('Rhode Island'),
                  ),
                  DropdownMenuItem(
                    value: 'SC',
                    child: Text('South Carolina'),
                  ),
                  DropdownMenuItem(
                    value: 'SD',
                    child: Text('South Dakota'),
                  ),
                  DropdownMenuItem(
                    value: 'TN',
                    child: Text('Tennessee'),
                  ),
                  DropdownMenuItem(
                    value: 'TX',
                    child: Text('Texas'),
                  ),
                  DropdownMenuItem(
                    value: 'UT',
                    child: Text('Utah'),
                  ),
                  DropdownMenuItem(
                    value: 'VT',
                    child: Text('Vermont'),
                  ),
                  DropdownMenuItem(
                    value: 'VA',
                    child: Text('Virginia'),
                  ),
                  DropdownMenuItem(
                    value: 'VI',
                    child: Text('Virgin Islands'),
                  ),
                  DropdownMenuItem(
                    value: 'WA',
                    child: Text('Washington'),
                  ),
                  DropdownMenuItem(
                    value: 'WV',
                    child: Text('West Virginia'),
                  ),
                  DropdownMenuItem(
                    value: 'WI',
                    child: Text('Wisconsin'),
                  ),
                  DropdownMenuItem(
                    value: 'WY',
                    child: Text('Wyoming'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    item['state'] = value!;
                  });
                },
              ),
            ),

            //state
            /*Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: stateController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'State',
                    hintText: 'Enter State'),
              ),
            ),*/

            //zipCode
            Text(
              'Zip Code',
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: zipCodeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter zip code'),
              ),
            ),

            //hours
            Text(
              'Hours',
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: hoursController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter hours'),
              ),
            ),

            //description
            Text(
              'Desctiption',
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: 100,
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter discription'),
                  ),
                )),

            TextButton(
              onPressed: () {
                if (checkIfAllFieldsValid() == 0) {
                  buildItem();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PostReview(
                        item: item,
                      ),
                    ),
                  );
                }
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
