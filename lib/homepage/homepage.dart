import 'package:flutter/material.dart';
import 'package:utool/item/item_data.dart';
import 'package:utool/card/card_layout.dart';
import 'package:utool/appbar/appbar_layouts.dart';
import 'package:utool/appbar/bottom_appbar.dart';
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
        model: "2172b",
        price: "500",
        rentPriceInterval: Intervals.HOURLY,
        condition: "Used",
        useType: UseType.PICK_UP,
        address: "123 Side St, Tuscaloosa, AL, 35402",
        deliveryFee: "250",
        hours: "127",
        description: "This is a wood sun-o-co wood chipper. It is in good condition and runs very well. I can deliver it to you or you can come pick it up."),
    const ItemData(
        type: "Stump Grinder",
        imgLinks: ["assets/stump_grinder.jpg"],
        brand: "Carlton",
        model: "110c",
        price: "750",
        rentPriceInterval: Intervals.HOURLY,
        condition: "Like New",
        useType: UseType.PICK_UP,
        address: "321 Main Ave, Tuscaloosa, 35404",
        deliveryFee: "null",
        hours: "242",
        description: "This is my Carlton stump grinder. It has had regular services for it's entire life and runs great. I cannot deliver it so it is for pickup only."),
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
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Create',
        //child: const Icon(Icons.add),
        child: const Text('Lend'),
      ),
      */
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}