/*
  Description: Serves as the 'main' page for the app. This is where users
               can explore various items on the store, upload their items,
               view their account, send messages, etc.
  Contributors: Aaron Schofield
*/

import 'package:flutter/material.dart';
import 'package:utool/appbar/appbar_layouts.dart';
import 'package:utool/item/item_data.dart';
import 'package:utool/card/card_layout.dart';
import 'package:utool/enums/enums.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:utool/message/message.dart';
import 'package:utool/post/post.dart';
import 'package:utool/user/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<ItemData> items = [
  //   const ItemData(
  //       type: "Wood Chipper",
  //       imgLinks: ["assets/woodchipper_placeholder.png"],
  //       brand: "Sun-O-Co",
  //       model: "2172b",
  //       price: "500",
  //       rentPriceInterval: Intervals.HOURLY,
  //       condition: "Used",
  //       useType: UseType.PICK_UP,
  //       address: "123 Side St, Tuscaloosa, AL, 35402",
  //       deliveryFee: "250",
  //       hours: "127",
  //       description:
  //           "This is a wood sun-o-co wood chipper. It is in good condition and runs very well. I can deliver it to you or you can come pick it up."),
  //   const ItemData(
  //       type: "Stump Grinder",
  //       imgLinks: ["assets/stump_grinder.jpg"],
  //       brand: "Carlton",
  //       model: "110c",
  //       price: "750",
  //       rentPriceInterval: Intervals.HOURLY,
  //       condition: "Like New",
  //       useType: UseType.PICK_UP,
  //       address: "321 Main Ave, Tuscaloosa, 35404",
  //       deliveryFee: "null",
  //       hours: "242",
  //       description:
  //           "This is my Carlton stump grinder. It has had regular services for it's entire life and runs great. I cannot deliver it so it is for pickup only."),
  //   const ItemData(
  //       type: "Planer",
  //       imgLinks: ["assets/pruitt_planer.jpg"],
  //       brand: "Buss",
  //       model: "55",
  //       price: "150",
  //       rentPriceInterval: Intervals.HOURLY,
  //       condition: "Used",
  //       useType: UseType.STORE_USE_ONLY,
  //       address: "255 Industrial Pkwy",
  //       deliveryFee: "N/A",
  //       hours: "4231",
  //       description:
  //           "This is our Buss industrial planer model 55. It has a lot of hours but works great. Pickup and delivery not available. Must use at our location."),
  //   const ItemData(
  //       type: "Bush Hog",
  //       imgLinks: ["assets/kubota_bush_hog.jpg"],
  //       brand: "Kubota",
  //       model: "l3400",
  //       price: "450",
  //       rentPriceInterval: Intervals.WEEKLY,
  //       condition: "Good",
  //       useType: UseType.PICK_UP,
  //       address: "7212 Jack Warner Pkwy",
  //       deliveryFee: "N/A",
  //       hours: "210",
  //       description:
  //           "60\" l3400 Kubota Bush hog. The blades and belts were replaced very recently so it is good to go for any large field that you need it for. I can't deliver it, so it must be picked up. Message me for details!"),
  //   const ItemData(
  //       type: "Skidsteer",
  //       imgLinks: ["assets/bobcat_skidsteer_s650_with_bucket.jpg"],
  //       brand: "Bobcat",
  //       model: "s650",
  //       price: "1400",
  //       rentPriceInterval: Intervals.WEEKLY,
  //       condition: "Like New",
  //       useType: UseType.DELIVERY,
  //       address: "1012 Main St. ",
  //       deliveryFee: "100",
  //       hours: "342",
  //       description:
  //           "This is our like new 2012 Bobcat skidsteer. It is in very good condition. It does have a small hydraulic leak. It comes with a bucket. Any other attachments will not be provided. Also, it is for delivery ONLY. No pick up is available."),
  // ];

  List<ItemData> items = [];

  // Load firestore data when homepage is initialized
  @override
  void initState() {
    getRecords();
    // If an item is added to the database, add it to the data list (automatically display new items)
    FirebaseFirestore.instance
        .collection('Items')
        .snapshots()
        .listen((records) {
      mapRecords(records);
    });
    super.initState();
  }

  // Pull data from Items collection on Firebase
  getRecords() async {
    var records = await FirebaseFirestore.instance.collection('Items').get();
    mapRecords(records);
  }

  /*
  * Description: Converts a string to the equivalent Interval enum. Throws exception, if a match is not found
  * Contributors: Aaron Schofield
  */
  Intervals strToInterval(String str) {
    switch (str) {
      case 'HOURLY':
        return Intervals.HOURLY;
      case 'DAILY':
        return Intervals.DAILY;
      case 'WEEKLY':
        return Intervals.WEEKLY;
      case 'MONTHLY':
        return Intervals.MONTHLY;
      default:
        throw Exception('Invalid interval string in database: $str');
    }
  }

  /*  Description:  Converts a string to the equivalent UseType enum. Throws exception, if a match is not found
   *  Contributors: Aaron Schofield */
  UseType strToUseType(String str) {
    switch (str) {
      case 'DELIVERY':
        return UseType.DELIVERY;
      case 'PICK_UP':
        return UseType.PICK_UP;
      case 'STORE_USE_ONLY':
        return UseType.STORE_USE_ONLY;
      default:
        throw Exception('Invalid UseType string in database: $str');
    }
  }

  /* Description: Converts a list of dynamic objects
   *              into a list of String objects and returns it.
   *              This is necessary because items stored as
   *              arrays on firebase are stored as dynamic objects.
   * Contributors: Aaron Schofield
   */
  List<String> dynamicListToStringList(List<dynamic> dynamicList) {
    List<String> stringList = dynamicList.map((e) => e.toString()).toList();
    return stringList;
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    var list = records.docs
        .map(
          (item) => ItemData(
            id: item['id'],
            type: item['type'],
            brand: item['brand'],
            model: item['model'],
            price: item['price'].toDouble(),
            rentPriceInterval: strToInterval(item['rentPriceInterval']),
            condition: item['condition'],
            useType: strToUseType(item['useType']),
            addressLine1: item['addressLine1'],
            addressLine2: item['addressLine2'],
            city: item['city'],
            state: item['state'],
            zipCode: item['zipCode'].toDouble(),
            deliveryFee: item['deliveryFee'].toDouble(),
            hours: item['hours'].toDouble(),
            description: item['description'],
            imgLinks: item['imgLinks'],
          ),
        )
        .toList();

    setState(
      () {
        items = list;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLayouts.homeAppBarLayout(context),
      body: items.isNotEmpty
          ? ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CardLayout(itemData: items[index]);
              },
            )
          : const Center(
              child: Text('No items to display'),
            ),
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Create',
        //child: const Icon(Icons.add),
        child: const Text('Lend'),
      ),
      */
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.message, title: 'Messages'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        style: TabStyle.fixedCircle,
        cornerRadius: 25.0,
        backgroundColor: Colors.orangeAccent,
        // onTap: (int i) => print('click index=$i'),
        onTap: (int i) {
          // Message button click
          if (i == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Message(),
              ),
            );
          }
          // Post button click
          else if (i == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Post(),
              ),
            );

            /*ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("TODO: Add item post page"),
                duration: Duration(seconds: 3),
              ),
            );*/
          }
          // User button click
          else if (i == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => UserProfile()));
          }
        },
      ),
    );
  }
}

/*
List<ItemData> sort(List<ItemData> items, int mode) {
  //mode determines how we want the list sorted
  //using buble sort for all modes, slow but simple to write
  int len = items.length;

  if (mode == 0) {
    return items;
  }
  else if (mode == 1) {
    //sort by $-$$$

    for (int i = 0; i < len - 1; i++) {
      for (int j = 0; j < len - i - 1; j++) {
        if (items.price[j] > items.price[j + 1]) {
          ItemData temp = items[j];
          items[j] = items[j + 1];
          items[j + 1] = temp;
        }
      }
    }
    return (items);
  }
  else if (mode == 2) {
    //sort by $$$-$

    for (int i = 0; i < len - 1; i++) {
      for (int j = 0; j < len - i - 1; j++) {
        if (items.price[j] < items.price[j + 1]) {
          ItemData temp = items[j];
          items[j] = items[j + 1];
          items[j + 1] = temp;
        }
      }
    }
    return (items);
  }
  else if (mode == 2) {
    //sort by distance

    for (int i = 0; i < len - 1; i++) {
      for (int j = 0; j < len - i - 1; j++) {
        if (items.distance[j] > items.distance[j + 1]) {
          ItemData temp = items[j];
          items[j] = items[j + 1];
          items[j + 1] = temp;
        }
      }
    }
    return (items);
  }
  else if (mode == 2) {
    //sort by distance

    for (int i = 0; i < len - 1; i++) {
      for (int j = 0; j < len - i - 1; j++) {
        if (items.rating[j] < items.rating[j + 1]) {
          ItemData temp = items[j];
          items[j] = items[j + 1];
          items[j + 1] = temp;
        }
      }
    }
    return (items);
  }else
    return items;
}
*/
