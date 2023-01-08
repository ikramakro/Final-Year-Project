// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/Screen/Home_Screen/HomeScreen.dart';

import 'UI/Components/Customrow.dart';

// ignore: must_be_immutable
class ItemDetailScreen extends StatelessWidget {
  String image, name, des;
  int price;
  ItemDetailScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.des,
      required this.price});
  var intheight = Random().nextInt(1) + 5;
  var inthealthy = Random().nextInt(10) + 90;
  var intwidth = Random().nextInt(10) + 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 159, 194, 194),
      body: Stack(children: [
        SizedBox(
          // height: 400,
          // width: 300,
          child: Padding(
            padding: const EdgeInsets.only(top: 70, left: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                  width: 400,
                  child: Image.network(
                    image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: .2,
          minChildSize: .2,
          maxChildSize: .6,
          builder: (context, scrollController) {
            return Center(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ListView(controller: scrollController, children: [
                    const Divider(indent: 120, thickness: 3, endIndent: 120),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  fontSize: 22.sp, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\$$price',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                              color: const Color(0xff184a2c),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),

                                const Text(
                                  '1',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),

                                // ignore: prefer_const_constructors
                                IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ]),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'About',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(des),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 60,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CustomRow(
                            icon: Icons.height,
                            text: 'Height',
                            text2: intheight.toString(),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          CustomRow(
                              icon: Icons.water_drop,
                              text: 'Healthy',
                              text2: '$inthealthy %'),
                          CustomRow(
                              icon: Icons.width_full,
                              text: 'Width',
                              text2: intwidth.toString())
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          },
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey[200])),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 100),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xff184a2c),
                            ),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          child: const Text(
                            'buy now',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              ),
            );
          },
        )
      ]),
    );
  }
}
