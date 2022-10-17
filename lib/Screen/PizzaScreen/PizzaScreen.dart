import 'package:flutter/material.dart';
import 'package:fyp/Components/ReusebleContainer.dart';

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({super.key});

  @override
  State<PizzaScreen> createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {
  List path = [
    'Assets/Images/Pizza/ChicagoPizza.png',
    'Assets/Images/Pizza/DessertPizza.png',
    'Assets/Images/Pizza/DetroitPizza.png',
    'Assets/Images/Pizza/GreekPizza.png',
    'Assets/Images/Pizza/HawaiianPizza.png',
    'Assets/Images/Pizza/NeapolitanPizza.png',
    'Assets/Images/Pizza/NewYorkPizza.png',
    'Assets/Images/Pizza/PanPizza.png',
    'Assets/Images/Pizza/SicilianPizza.png',
    'Assets/Images/Pizza/SquarePizza.png',
    'Assets/Images/Pizza/BagelPizza.png',
    'Assets/Images/Pizza/BreakfastPizza.png',
    'Assets/Images/Pizza/CaliforniaPizza.png',
  ];
  List namelist = [
    'BagelPizza',
    'BreakfastPizza',
    'CaliforniaPizza',
    'ChicagoPizza',
    'DessertPizza',
    'DetroitPizza',
    'GreekPizza',
    'HawaiianPizza',
    'NeapolitanPizza',
    'NewYorkPizza',
    'PanPizza',
    'SicilianPizza',
    'SquarePizza'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pizza Screen')),
      body: GridView.builder(
        itemCount: namelist.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return ReusebleContainer(path: path[index], name: namelist[index]);
        },
      ),
    );
  }
}
