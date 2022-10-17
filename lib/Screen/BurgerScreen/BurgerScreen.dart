import 'package:flutter/material.dart';
import 'package:fyp/Components/ReusebleContainer.dart';

class BurgerScreen extends StatefulWidget {
  const BurgerScreen({super.key});

  @override
  State<BurgerScreen> createState() => _BurgerScreenState();
}

class _BurgerScreenState extends State<BurgerScreen> {
  List path = [
    'Assets/Images/Burger/1Bickyburger.png',
    'Assets/Images/Burger/1cheeseburger.png',
    'Assets/Images/Burger/1Elkburgers.png',
    'Assets/Images/Burger/1Kiwiburger.png',
    'Assets/Images/Burger/1Lutherburger.png',
    'Assets/Images/Burger/1Pastramiburger.png',
    'Assets/Images/Burger/1Ramenburger.png',
    'Assets/Images/Burger/1Riceburger.png',
    'Assets/Images/Burger/1slopperBurger.png',
    'Assets/Images/Burger/1Slugburger.png',
    'Assets/Images/Burger/BeanBurgers.png',
    'Assets/Images/Burger/Beef_Burgers.png',
    'Assets/Images/Burger/Pimentoburger.png',
    'Assets/Images/Burger/Chimichurris_Burger.png',
    'Assets/Images/Burger/Mushroom_Burgers.png'
  ];
  List namelist = [
    'Bickyburger',
    'BeanBurgers',
    'Elkburgers',
    'cheeseburger',
    'FritaBurger',
    'Kiwiburger',
    'Lutherburger',
    'Pastramiburger',
    'Pimentoburger',
    'Ramenburger',
    'Riceburger',
    'slopperBurger',
    'Slugburger',
    'TurkeyBurgers',
    'WildBurgers',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Burger Screen')),
      body: GridView.builder(
        itemCount: namelist.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return ReusebleContainer(
            name: namelist[index],
            path: path[index],
          );
        },
      ),
    );
  }
}
