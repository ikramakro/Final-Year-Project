// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:fyp/UI/Components/MyText.dart';
import 'package:fyp/Util/Colors.dart';

class ReusebleContainer extends StatefulWidget {
  String name, path;
  int index, price;
  IconData? icon;
  // VoidCallback? ontap;
  VoidCallback? favriteontap;
  ReusebleContainer(
      {Key? key,
      required this.path,
      required this.name,
      required this.index,
      this.price = 0,
      this.favriteontap,
      this.icon})
      : super(key: key);

  @override
  State<ReusebleContainer> createState() => _ReusebleContainerState();
}

class _ReusebleContainerState extends State<ReusebleContainer> {
  final firestore =
      FirebaseFirestore.instance.collection('Favorites').snapshots();

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
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: MyText(
              text: '${widget.price.toString()}\$',
              size: 18,
              weight: FontWeight.bold,
            ),
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
                onPressed: widget.favriteontap,
                icon: Icon(
                  widget.icon,
                  color: Colors.red,
                )),
          ),
        ]),
        SizedBox(
          height: 86.400,
          width: 200,
          child: Image(
            image: NetworkImage(
              widget.path,
            ),
            fit: BoxFit.contain,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: widget.name,
                size: 15,
                weight: FontWeight.bold,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        height: 20,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: AppColors.Maincolor),
                        child: Center(
                            child: MyText(
                          text: 'Add to Cart',
                          size: 14,
                          weight: FontWeight.bold,
                          color: Colors.white,
                        ))),
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
