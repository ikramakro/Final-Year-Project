import 'package:flutter/material.dart';
import 'package:fyp/Components/ReusebleContainer.dart';

class HotWingScreen extends StatefulWidget {
  const HotWingScreen({super.key});

  @override
  State<HotWingScreen> createState() => _HotWingScreenState();
}

class _HotWingScreenState extends State<HotWingScreen> {
  List path = [
    'Assets/Images/Hotwings/5Hotwings.png',
    'Assets/Images/Hotwings/kfc.png',
    'Assets/Images/Hotwings/kfc.png',
    'Assets/Images/Hotwings/20hotwings.png',
  ];

  List name = [
    '5 HotWings',
    '10 KFC Hotwings',
    '20 KFC Hotwings',
    '20 Hotwings'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HotWings Screen')),
      body: GridView.builder(
        itemCount: name.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return ReusebleContainer(path: path[index], name: name[index]);
        },
      ),
    );
  }
}
