import 'package:flutter/material.dart';
import 'package:utool/appbar/appbar_layouts.dart';
import 'package:utool/item/item_data.dart';
import 'package:utool/card/card_layout.dart';
import 'package:utool/appbar/bottom_appbar.dart';
import 'package:utool/enums/enums.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

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
        description:
            "This is a wood sun-o-co wood chipper. It is in good condition and runs very well. I can deliver it to you or you can come pick it up."),
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
        description:
            "This is my Carlton stump grinder. It has had regular services for it's entire life and runs great. I cannot deliver it so it is for pickup only."),
    const ItemData(
        type: "Planer",
        imgLinks: ["assets/pruitt_planer.jpg"],
        brand: "Buss",
        model: "55",
        price: "150",
        rentPriceInterval: Intervals.HOURLY,
        condition: "Used",
        useType: UseType.STORE_USE_ONLY,
        address: "255 Industrial Pkwy",
        deliveryFee: "N/A",
        hours: "4231",
        description:
            "This is our Buss industrial planer model 55. It has a lot of hours but works great. Pickup and delivery not available. Must use at our location."),
    const ItemData(
        type: "Bush Hog",
        imgLinks: ["assets/kubota_bush_hog.jpg"],
        brand: "Kubota",
        model: "l3400",
        price: "450",
        rentPriceInterval: Intervals.WEEKLY,
        condition: "Good",
        useType: UseType.PICK_UP,
        address: "7212 Jack Warner Pkwy",
        deliveryFee: "N/A",
        hours: "210",
        description:
            "60\" l3400 Kubota Bush hog. The blades and belts were replaced very recently so it is good to go for any large field that you need it for. I can't deliver it, so it must be picked up. Message me for details!"),
    const ItemData(
        type: "Skidsteer",
        imgLinks: ["assets/bobcat_skidsteer_s650_with_bucket.jpg"],
        brand: "Bobcat",
        model: "s650",
        price: "1400",
        rentPriceInterval: Intervals.WEEKLY,
        condition: "Like New",
        useType: UseType.DELIVERY,
        address: "1012 Main St. ",
        deliveryFee: "100",
        hours: "342",
        description:
            "This is our like new 2012 Bobcat skidsteer. It is in very good condition. It does have a small hydraulic leak. It comes with a bucket. Any other attachments will not be provided. Also, it is for delivery ONLY. No pick up is available."),
  ];

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
        style: TabStyle.fixed,
        cornerRadius: 25.0,
        backgroundColor: Colors.orangeAccent,
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}
