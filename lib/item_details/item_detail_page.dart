import 'package:flutter/material.dart';
import 'package:utool/item/item_data.dart';
import 'package:utool/enums/enums.dart';

class ItemDetails extends StatelessWidget {
  final ItemData item; // Data for item to be displayed

  const ItemDetails({
    Key? key,
    required this.item,
  }) : super(key: key);

  String formatRentDuration(Intervals interval) {
    if (interval.name == 'HOURLY') return 'hour';
    if (interval.name == 'DAILY') return 'day';
    if (interval.name == 'WEEKLY') return 'week';
    if (interval.name == 'MONTHLY') return 'month';

    return 'null';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Details'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                  size: 30,
                ))
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                item.imgLinks[0],
                width: 300,
                height: 300,
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.type,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '\$${item.price} \n per ${formatRentDuration(item.rentPriceInterval)}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
