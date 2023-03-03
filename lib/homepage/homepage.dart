import 'package:flutter/material.dart';
import 'package:utool/item/item_data.dart';
import 'package:utool/card/card_layout.dart';
import 'package:utool/appbar/appbar_layouts.dart';
import 'package:utool/enums/enums.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ItemData> items = [
    const ItemData(
        type: "Wood Chipper",
        imgLinks: ["assets/woodchipper_placeholder.png"],
        brand: "Sun-O-Co",
        price: "500",
        rentPriceInterval: Intervals.HOURLY,
        condition: "Used",
        useType: UseType.PICK_UP,
        address: "123 Side St, Tuscaloosa, AL, 35402",
        deliveryFee: "250"),
    const ItemData(
        type: "Stump Grinder",
        imgLinks: ["assets/stump_grinder.jpg"],
        brand: "Carlton",
        price: "750",
        rentPriceInterval: Intervals.HOURLY,
        condition: "Like New",
        useType: UseType.PICK_UP,
        address: "321 Main Ave, Tuscaloosa, 35404",
        deliveryFee: "null")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar().homeAppBarLayout(),
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
    );
  }
}
