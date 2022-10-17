import 'package:flutter/material.dart';
import 'package:fyp/Components/ReusebleContainer.dart';

class FrenchFry extends StatefulWidget {
  const FrenchFry({super.key});

  @override
  State<FrenchFry> createState() => _FrenchFryState();
}

class _FrenchFryState extends State<FrenchFry> {
  List path = [
    'Assets/Icons/french_fry.png',
    'Assets/Icons/french_fry.png',
    'Assets/Icons/french_fry.png',
    'Assets/Icons/french_fry.png'
  ];

  List name = ['Small', 'Medium', 'Larg', 'Extra large'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('French Fry')),
      body: GridView.builder(
        itemCount: name.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200),
        itemBuilder: (context, index) {
          return ReusebleContainer(path: path[index], name: name[index]);
        },
      ),
    );
  }
}
