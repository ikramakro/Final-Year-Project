// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fyp/UI/Components/ReusebleContainer.dart';

class DetialScreen extends StatefulWidget {
  String name;
  String price;
  String url;
  DetialScreen({
    Key? key,
    this.name = '',
    this.price = '',
    this.url = '',
  }) : super(key: key);

  @override
  State<DetialScreen> createState() => _DetialScreenState();
}

class _DetialScreenState extends State<DetialScreen> {
  DetialScreen detialScreen = DetialScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReusebleContainer(
        index: 1,
        name: detialScreen.name,
        path: detialScreen.url,
      ),
    );
  }
}
