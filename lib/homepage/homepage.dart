import 'package:flutter/material.dart';
import 'package:utool/card/card_data.dart';
import 'package:utool/appbar/appbar_layouts.dart';
import 'package:utool/enums/enums.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CardData> items = [
    const CardData(
        type: "Wood Chipper",
        imgLink: "assets/woodchipper_placeholder.png",
        brand: "Sun-O-Co",
        price: "500",
        rentPriceInterval: Intervals.HOURLY,
        condition: "Used",
        useType: UseType.PICK_UP,
        address: "123 Side St, Tuscaloosa, AL, 35402",
        deliveryFee: "250"),
    const CardData(
        type: "Stump Grinder",
        imgLink: "assets/stump_grinder.jpg",
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
                  return CardData(
                      type: items[index].type,
                      imgLink: items[index].imgLink,
                      brand: items[index].brand,
                      price: items[index].price,
                      rentPriceInterval: items[index].rentPriceInterval,
                      condition: items[index].condition,
                      useType: items[index].useType,
                      address: items[index].address,
                      deliveryFee: items[index].deliveryFee);
                },
              )
            : const Center(
                child: Text('No items to display'),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Create',
          //child: const Icon(Icons.add),
          child: const Text('Lend'),
        ));
  }
}
