import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/UI/Components/MyText.dart';
import 'package:fyp/Screen/FrenchFry/FrenchFry.dart';
import 'package:fyp/Screen/HotWings/HotWingScrren.dart';
import 'package:fyp/Util/Colors.dart';
import 'package:fyp/main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../UI/Components/ReusebleContainer.dart';
import '../BurgerScreen/BurgerScreen.dart';
import '../PizzaScreen/PizzaScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  final ref = FirebaseFirestore.instance.collection('User');
  final user = FirebaseAuth.instance.currentUser;
  GlobalKey<ScaffoldState> scafflodkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scafflodkey,
        drawer: Drawer(
            child: ListView(
          children: [
            FutureBuilder<DocumentSnapshot>(
              future: ref.doc(user!.uid).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return const Text("Document does not exist");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return Container(
                    height: 150.h,
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 80.h,
                              child: Image.asset('Assets/Icons/burger.png')),
                          MyText(
                            text: '${data['Name']}',
                            weight: FontWeight.bold,
                            size: 20,
                          ),
                          MyText(
                            text: '${data['Email']}',
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const Text("loading");
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: MyText(
                text: 'Home',
                weight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.keyboard_voice,
                color: Colors.black,
              ),
              title: MyText(
                text: 'Alan Command',
                weight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: MyText(
                text: 'About us',
                weight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: MyText(
                text: 'Log Out',
                weight: FontWeight.bold,
              ),
            ),
          ],
        )),
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
                    children: [
                      InkWell(
                          onTap: () {
                            scafflodkey.currentState!.openDrawer();
                          },
                          child: SizedBox(
                              height: 50.h,
                              width: 50.w,
                              child: Image.asset('Assets/Icons/burgerc.png'))),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: greeting(),
                              color: Colors.grey,
                              size: 16,
                              weight: FontWeight.bold,
                            ),
                            FutureBuilder<DocumentSnapshot>(
                              future: ref.doc(user!.uid).get(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return const Text("Something went wrong");
                                }

                                if (snapshot.hasData &&
                                    !snapshot.data!.exists) {
                                  return const Text("Document does not exist");
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  Map<String, dynamic> data = snapshot.data!
                                      .data() as Map<String, dynamic>;
                                  return MyText(
                                    text: data['Name'],
                                    size: 20,
                                    weight: FontWeight.bold,
                                  );
                                }

                                return const Text("loading");
                              },
                            )
                          ],
                        ),
                      ),
                      Badge(
                        badgeContent: const Text('0'),
                        child: const Icon(Icons.shopping_cart)),
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
                                      builder: (context) =>
                                          const PizzaScreen()));
                            }),
                            child: CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 219, 218, 218),
                                radius: 35,
                                child: Center(
                                    child: Image.asset(
                                        'Assets/Icons/pizza5.png'))),
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

                  // SizedBox(
                  //   height: 370.h,
                  //   child: GridView.builder(
                  //     gridDelegate:
                  //         const SliverGridDelegateWithMaxCrossAxisExtent(
                  //             maxCrossAxisExtent: 220,
                  //             crossAxisSpacing: 5,
                  //             mainAxisSpacing: 10),
                  //     itemCount: 8,
                  //     itemBuilder: (context, index) {
                  //       return ReusebleContainer(
                  //         name: 'Vege Burger',
                  //         path: 'Assets/Images/Burger/1Kiwiburger.png',
                  //         index: index,
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: const GNav(
          tabs: [
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'Cart',
            ),
          ],
        ));
  }
}
