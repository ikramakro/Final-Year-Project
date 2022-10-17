import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/Components/MyText.dart';
import 'package:fyp/Screen/FrenchFry/FrenchFry.dart';
import 'package:fyp/Screen/HotWings/HotWingScrren.dart';
import 'package:fyp/Util/Colors.dart';

import '../../Components/ReusebleContainer.dart';
import '../BurgerScreen/BurgerScreen.dart';
import '../PizzaScreen/PizzaScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Good Morining',
                          color: Colors.grey,
                        ),
                        MyText(
                          text: 'Amile Worden',
                          size: 20,
                          weight: FontWeight.bold,
                        )
                      ],
                    ),
                    Chip(
                      label: const Text('Location'),
                      avatar: const Icon(
                        Icons.place,
                        color: AppColors.Maincolor,
                      ),
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.only(
                          top: 10.h, bottom: 10.h, left: 8.w, right: 8.w),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextFormField(
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Search here',
                      prefixIcon: const Icon(Icons.search),
                      // disabledBorder: InputBorder.none,
                      // enabledBorder: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.white))),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                MyText(
                  text: 'Cetagories 🙂',
                  size: 20.sp,
                  weight: FontWeight.bold,
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BurgerScreen()));
                          },
                          child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 219, 218, 218),
                              radius: 35,
                              child:
                                  Image.asset('Assets/Icons/realburger.png')),
                        ),
                        MyText(
                          text: 'Burger',
                          size: 15,
                          weight: FontWeight.bold,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PizzaScreen()));
                          }),
                          child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 219, 218, 218),
                              radius: 35,
                              child: Center(
                                  child:
                                      Image.asset('Assets/Icons/pizza5.png'))),
                        ),
                        MyText(
                          text: 'Pizza',
                          size: 15,
                          weight: FontWeight.bold,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HotWingScreen()));
                          },
                          child: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 219, 218, 218),
                            radius: 35,
                            child: Image.asset('Assets/Icons/hotwing.png'),
                          ),
                        ),
                        MyText(
                          text: 'Hot Wings',
                          size: 15,
                          weight: FontWeight.bold,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FrenchFry()));
                          },
                          child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 219, 218, 218),
                              radius: 35,
                              child:
                                  Image.asset('Assets/Icons/french_fry.png')),
                        ),
                        MyText(
                          text: 'French Fry',
                          size: 15,
                          weight: FontWeight.bold,
                        )
                      ],
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  height: 20.h,
                ),
                MyText(
                  text: 'Best Seling  🔥',
                  size: 20,
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  height: 370.h,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 220,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 10),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return ReusebleContainer(
                        name: 'Vege Burger',
                        path: 'Assets/Images/Burger/1Kiwiburger.png',
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
