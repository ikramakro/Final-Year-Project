// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fyp/Components/MyText.dart';
import 'package:fyp/Util/Colors.dart';

class ReusebleContainer extends StatelessWidget {
  String name, path;
  ReusebleContainer({Key? key, required this.path, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 220,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(4, 4)),
          ],
          color: const Color.fromARGB(255, 219, 218, 218),
          borderRadius: BorderRadius.circular(25)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: MyText(
              text: '\$420',
              size: 18,
              weight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 70),
            child: Icon(Icons.shopping_bag),
          )
        ]),
        SizedBox(
          height: 96.400,
          width: 200,
          child: Image(
            image: AssetImage(
              path,
            ),
            fit: BoxFit.contain,
          ),
        ),
        // ListTile(
        //   title: const Text(
        //     'Veg Burger',
        //   ),
        //   subtitle: const Text(
        //     '\$420',
        //   ),
        //   trailing: Padding(
        //     padding: const EdgeInsets.only(left: 10),
        //     child: IconButton(
        //       onPressed: () {},
        //       icon: Icon(Icons.add),
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: name,
                size: 15,
                weight: FontWeight.bold,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // MyText(
                  //   text: '\$420',
                  //   size: 18,
                  // ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: AppColors.Maincolor),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 10),
                    child: MyText(
                      text: '1',
                      size: 20,
                      weight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: AppColors.Maincolor),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
