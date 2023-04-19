import 'package:flutter/material.dart';
import 'package:utool/item/item_data.dart';
import 'package:utool/enums/enums.dart';
import 'package:utool/item_details/rent.dart';

class ItemDetails extends StatelessWidget {
  final ItemData item; // Data for item to be displayed

  const ItemDetails({
    Key? key,
    required this.item,
  }) : super(key: key);

  String getDisplayPicture() {
    if (item.imgLinks.isNotEmpty) return item.imgLinks;
    return 'assets/no_image.png';
  }

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
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Center(child: Text('Details')),
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
          body: Column(
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                child: Image.asset(
                  getDisplayPicture(),
                ),
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
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Rent(
                                    item: item,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              backgroundColor: Colors.deepOrangeAccent,
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
                      const SizedBox(height: 20),
                      const Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Brand: ${item.brand}\nModel: ${item.model}\nHours: ${item.hours}",
                              style: const TextStyle(color: Colors.black),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              item.description,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
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
