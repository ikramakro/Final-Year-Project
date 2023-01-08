import 'package:alan_voice/alan_voice.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/Cartprovider.dart';
import 'package:fyp/Screen/AboutUs/AboutUS.dart';
import 'package:fyp/Screen/Alan_Command/AlanCommand.dart';
import 'package:fyp/Screen/CartScreen.dart';
import 'package:fyp/Screen/auth/LoginScreen.dart';
import 'package:fyp/UI/Components/MyText.dart';
import 'package:fyp/Screen/FrenchFry/FrenchFry.dart';
import 'package:fyp/Screen/HotWings/HotWingScrren.dart';
import 'package:fyp/UI/Components/ReusebleContainer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import '../BurgerScreen/BurgerScreen.dart';
import '../PizzaScreen/PizzaScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final firestore =
    FirebaseFirestore.instance.collection('Favorites').snapshots();
final firestore1 = FirebaseFirestore.instance.collection('Favorites');

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState() {
    AlanVoice.addButton(
        "9676b13daf7882290767b6aebab788782e956eca572e1d8b807a3e2338fdd0dc/stage");
    AlanVoice.onCommand.add((command) => _handlecommand(command.data));
  }
  // @override
  // void initState() {
  //   super.initState();
  //   alanAisetup();
  // }

  alanAisetup() {
    AlanVoice.addButton(
        "9676b13daf7882290767b6aebab788782e956eca572e1d8b807a3e2338fdd0dc/stage");
    AlanVoice.onCommand.add((command) => _handlecommand(command.data));
  }

  final Burgerref = FirebaseFirestore.instance.collection('Burger');
  _handlecommand(Map<String, dynamic> command) async {
    switch (command['command']) {
      case 'forward':
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
          break;
        }
      case 'burgerscreen':
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BurgerScreen(),
              ));
          break;
        }
      case 'hotwingsscreen':
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HotWingScreen(),
              ));
          break;
        }
      case 'frenchfryscreen':
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FrenchFry(),
              ));
          break;
        }
      case 'pizzascreen':
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PizzaScreen(),
              ));
          break;
        }
      case 'Logout':
        {
          FirebaseAuth.instance.signOut().then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ));
          });

          break;
        }
      case 'MushroomBurgers':
        {
          // Query query = Burgerref.where("Name", isEqualTo: "ElkBurger");
          // var querySnapshot = await query.get();
          // DocumentSnapshot snapshot = querySnapshot.docs.first;
          // String itemId = snapshot.id;
          // QuerySnapshot documentSnapshot = await FirebaseFirestore.instance
          //     .collection('Burger')
          //     .doc(itemId)
          //     .get() as dynamic;
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('0wGecNuzSD7iM23aK2Br').set({
            'Image': 'https://i.ibb.co/3CjgCPw/Mushroom-Burgers.png',
            'Name': 'MushroomBurgers',
            'Price': 560,
            'Quantity': 1,
          });

          break;
        }
      case 'ElkBurger':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('2LjTzHpd9otnH1Z7EeFg').set({
            'Image': 'https://i.ibb.co/RDVv9tP/1-Elkburgers.png',
            'Name': 'ElkBurger',
            'Price': 400,
            'Quantity': 1,
          });

          break;
        }
      case 'RiceBurger':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('4jso1z3lDMygxz8vEnyo').set({
            'Image': 'https://i.ibb.co/PW1604f/1-Riceburger.png',
            'Name': 'RiceBurger',
            'Price': 450,
            'Quantity': 1,
          });

          break;
        }
      case 'PimentoBurger':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('7akjFnxthXsBUdGlUlBz').set({
            'Image': 'https://i.ibb.co/T4cxchS/Pimentoburger.png',
            'Name': 'PimentoBurger',
            'Price': 380,
            'Quantity': 1,
          });

          break;
        }
      case 'TurkeyBurgers':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('D2jlOnYPtz4Y7U7AwT8c').set({
            'Image': 'https://i.ibb.co/93Dt9Kz/Turkey-Burgers.png',
            'Name': 'TurkeyBurgers',
            'Price': 550,
            'Quantity': 1,
          });

          break;
        }
      case 'WildBurgers':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('FHQ3gJVWSmno90uOajJUc').set({
            'Image': 'https://i.ibb.co/x60HBVs/Wild-Burgers.png',
            'Name': 'WildBurgers',
            'Price': 250,
            'Quantity': 1,
          });

          break;
        }
      case 'SlugBurger':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('G87G74x8ax2ojjAMHsn8').set({
            'Image': 'https://i.ibb.co/GWLd1rx/1-Slugburger.png',
            'Name': 'SlugBurger',
            'Price': 480,
            'Quantity': 1,
          });

          break;
        }
      case 'VeggieBurgers':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('GhVerMoctQK2q7b3F4pF').set({
            'Image': 'https://i.ibb.co/LzF5Ch7/Veggie-Burgers.png',
            'Name': 'VeggieBurgers',
            'Price': 450,
            'Quantity': 1,
          });

          break;
        }
      case 'BeeBurgers':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('IK1sOADx7dpUCZbyrLKF').set({
            'Image': 'https://i.ibb.co/n1k6jyD/Bean-Burgers.png',
            'Name': 'BeeBurgers',
            'Price': 600,
            'Quantity': 1,
          });

          break;
        }
      case 'BeefBurgers':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('WLdzOmoAvdRz5dsP7sJG').set({
            'Image': 'https://i.ibb.co/zn1QsTS/Beef-Burgers.png',
            'Name': 'BeefBurgers',
            'Price': 500,
            'Quantity': 1,
          });

          break;
        }
      case 'RamenBurger':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('XnbTdd8ohh1gYCMBam5E').set({
            'Image': 'https://i.ibb.co/4p2mf14/1-Ramenburger.png',
            'Name': 'RamenBurger',
            'Price': 220,
            'Quantity': 1,
          });

          break;
        }
      case 'BeanBurger':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('ZDXEfroTvVLJ2kPHWOdQ').set({
            'Image': 'https://i.ibb.co/CnqRJs0/1cheeseburger.png',
            'Name': 'BeanBurger',
            'Price': 220,
            'Quantity': 1,
          });

          break;
        }
      case 'SlopperBurger':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('aPQGZ3POLr7lncEj1DcJ').set({
            'Image': 'https://i.ibb.co/72GTcZB/1slopper-Burger.png',
            'Name': 'SlopperBurger',
            'Price': 330,
            'Quantity': 1,
          });

          break;
        }
      case 'ChimichurrisBurger':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('bPbHu2WyrptL3tjJCITc').set({
            'Image': 'https://i.ibb.co/Z2cVb4J/Chimichurris-Burger.png',
            'Name': 'ChimichurrisBurger',
            'Price': 480,
            'Quantity': 1,
          });

          break;
        }
      case 'BickyBurger':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('dTMq3kBie1KzOGGIvASz').set({
            'Image': 'https://i.ibb.co/fC2VxNk/1-Bickyburger.png',
            'Name': 'BickyBurger',
            'Price': 350,
            'Quantity': 1,
          });

          break;
        }
      case 'CheeseBurger':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('lF4JGoTALcrrj2gnN3lN').set({
            'Image': 'https://i.ibb.co/LN8V97K/1-Kiwiburger.png',
            'Name': 'CheeseBurger',
            'Price': 550,
            'Quantity': 1,
          });

          break;
        }
      case 'FritaBurger':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('mxoLZiXE9UfMVp5cvg0a').set({
            'Image': 'https://i.ibb.co/8Bs8jpM/1-Lutherburger.png',
            'Name': 'FritaBurger',
            'Price': 230,
            'Quantity': 1,
          });

          break;
        }
      case 'KiwiBurger':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('tja34tOzXwTgovAKGa7e').set({
            'Image': 'https://i.ibb.co/Z6xn2WY/1-Pastramiburger.png',
            'Name': 'KiwiBurger',
            'Price': 330,
            'Quantity': 1,
          });

          break;
        }
      case 'Small Frenchfry':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('Kd37qXofuoHqvhlwpg1e').set({
            'Image': 'https://i.ibb.co/zn5VDCM/french-fry.png',
            'Name': 'Small Frenchfry',
            'Price': 200,
            'Quantity': 1,
          });

          break;
        }
      case 'Medium FrenchFry':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('Xc5fBvXhCM3Sr1ugCpJI').set({
            'Image': 'https://i.ibb.co/zn5VDCM/french-fry.png',
            'Name': 'Medium FrenchFry',
            'Price': 400,
            'Quantity': 1,
          });

          break;
        }
      case 'Large FrenchFry':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('zFuB6txDtqQm9Io86zk0').set({
            'Image': 'https://i.ibb.co/zn5VDCM/french-fry.png',
            'Name': 'Large FrenchFry',
            'Price': 500,
            'Quantity': 1,
          });

          break;
        }
      case '20 HotWings':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('EUE0dWGHsgxuhdyvLmiD').set({
            'Image': 'https://i.ibb.co/LNF0q81/20hotwings.png',
            'Name': '20 HotWings',
            'Price': 800,
            'Quantity': 1,
          });

          break;
        }
      case '15 HotWings':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('IQM9L4xCei8sgLVvdjHO').set({
            'Image': 'https://i.ibb.co/qmfD0NT/kfc.png',
            'Name': '15 HotWings',
            'Price': 600,
            'Quantity': 1,
          });

          break;
        }
      case '5 HotWings':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('gF8Iz1xny72Ae8uz0Ug6').set({
            'Image': 'https://i.ibb.co/QdP4F4t/5-Hotwings.png',
            'Name': '5 HotWings',
            'Price': 200,
            'Quantity': 1,
          });

          break;
        }
      case '10 HotWings':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('pbzjndExOunTqJbAuxpQ').set({
            'Image': 'https://i.ibb.co/LNF0q81/20hotwings.png',
            'Name': '10 HotWings',
            'Price': 400,
            'Quantity': 1,
          });

          break;
        }
      case 'SicilianPizza':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('3OJFILIeTVIykysR2sL8').set({
            'Image': 'https://i.ibb.co/1q0tRzL/Sicilian-Pizza.png',
            'Name': 'SicilianPizza',
            'Price': 1200,
            'Quantity': 1,
          });

          break;
        }
      case 'DetroitPizza':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('9TWVS85h5GrzYzek7F5t').set({
            'Image': 'https://i.ibb.co/R2bWrGW/Detroit-Pizza.png',
            'Name': 'DetroitPizza',
            'Price': 1000,
            'Quantity': 1,
          });

          break;
        }
      case 'CaliforniaPizza':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('CqmZ3R6ArnU5EeHw7U2g').set({
            'Image': 'https://i.ibb.co/vjjB4wm/California-Pizza.png',
            'Name': 'CaliforniaPizza',
            'Price': 500,
            'Quantity': 1,
          });

          break;
        }
      case 'DessertPizza':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('GZgHNWE2yUSHSN5SG5Ov').set({
            'Image': 'https://i.ibb.co/7VCBXrb/Dessert-Pizza.png',
            'Name': 'DessertPizza',
            'Price': 800,
            'Quantity': 1,
          });

          break;
        }
      case 'NewYorkPizza':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('MiWl3PdAayyuYvJ82aY7').set({
            'Image': 'https://i.ibb.co/VHssJTt/New-York-Pizza.png',
            'Name': 'NewYorkPizza',
            'Price': 400,
            'Quantity': 1,
          });

          break;
        }
      case 'PanPizza':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('Sa4T8ZgAhjmJCM8tCpoY').set({
            'Image': 'https://i.ibb.co/grXKkb4/PanPizza.png',
            'Name': 'PanPizza',
            'Price': 450,
            'Quantity': 1,
          });

          break;
        }
      case 'ChicagoPizza':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('UA8wgWvE628PCbz1oR13').set({
            'Image': 'https://i.ibb.co/1TLcWgv/Chicago-Pizza.png',
            'Name': 'ChicagoPizza',
            'Price': 680,
            'Quantity': 1,
          });

          break;
        }
      case 'BagelPizza':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('jcnnZ5IRIuVvHfyUiO8H').set({
            'Image': 'https://i.ibb.co/Ntbfv8f/Bagel-Pizza.png',
            'Name': 'BagelPizza',
            'Price': 450,
            'Quantity': 1,
          });

          break;
        }
      case 'SquarePizza':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('lfuERtV63GsmAUONWicG').set({
            'Image': 'https://i.ibb.co/QPVyBvy/Square-Pizza.png',
            'Name': 'SquarePizza',
            'Price': 1300,
            'Quantity': 1,
          });

          break;
        }
      case 'HawaiianPizza':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('s0zyhnn1bNRAt52nQCNB').set({
            'Image': 'https://i.ibb.co/HppH0ZM/Hawaiian-Pizza.png',
            'Name': 'HawaiianPizza',
            'Price': 750,
            'Quantity': 1,
          });

          break;
        }
      case 'GreekPizza':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('vGG9RHiUVP6P9AaavOLz').set({
            'Image': 'https://i.ibb.co/dM8NB5G/Greek-Pizza.png',
            'Name': 'GreekPizza',
            'Price': 700,
            'Quantity': 1,
          });

          break;
        }
      case 'NeapolitanPizza':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('wRJURkmDJx4qbaS2J17I').set({
            'Image': 'https://i.ibb.co/yS6CD25/Neapolitan-Pizza.png',
            'Name': 'NeapolitanPizza',
            'Price': 1100,
            'Quantity': 1,
          });

          break;
        }
      case 'BreakfastPizza':
        {
          final cart = FirebaseFirestore.instance.collection('CartData');
          cart.doc('yNX8ZjOxg1nlCzBgVGfa').set({
            'Image': 'https://i.ibb.co/2ZT0tF5/Breakfast-Pizza.png',
            'Name': 'BreakfastPizza',
            'Price': 700,
            'Quantity': 1,
          });

          break;
        }
    }
  }

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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AlanCommand()));
              },
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
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutUs()));
              }),
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
              onTap: () {
                FirebaseAuth.instance.signOut().then(
                  (value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                );
              },
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
                          child: Image.asset('Assets/Icons/burgerc.png'),
                        ),
                      ),
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
                      Padding(
                        padding: EdgeInsets.only(left: 110.w),
                        child: Badge(
                            badgeContent: Consumer<CartProvider>(
                              builder: (context, value, child) {
                                return Text('${value.getCounter()}');
                              },
                            ),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CartScreen()));
                                },
                                icon: const Icon(
                                  Icons.shopping_cart,
                                  size: 35,
                                ))),
                      ),
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
                  StreamBuilder(
                    stream: firestore,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          height: 350.h,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 220,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 10),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return ReusebleContainer(
                                name: snapshot.data!.docs[index]['Name'],
                                path: snapshot.data!.docs[index]['Image']
                                    .toString(),
                                index: index,
                                price: snapshot.data!.docs[index]['Price'],
                                cartontap: () {
                                  final cart = FirebaseFirestore.instance
                                      .collection('CartData');
                                  cart.doc(snapshot.data!.docs[index].id).set({
                                    'Name': snapshot.data!.docs[index]['Name']
                                        .toString(),
                                    'Price': snapshot.data!.docs[index]['Price']
                                        .toString(),
                                    'Image': snapshot.data!.docs[index]['Image']
                                        .toString(),
                                    'Quantity': 1
                                  });
                                },
                                icon: snapshot.data!.docs[index]['Flag'] == true
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                favriteontap: () {
                                  if (snapshot.data!.docs[index]['Flag'] ==
                                      false) {
                                    firestore1
                                        .doc(snapshot.data!.docs[index].id
                                            .toString())
                                        .set({
                                      'Name': snapshot.data!.docs[index]
                                          ['Name'],
                                      'Image': snapshot
                                          .data!.docs[index]['Image']
                                          .toString(),
                                      'Price': snapshot.data!.docs[index]
                                          ['Price'],
                                      'Flag': true
                                    }).then((value) {
                                      firestore1.doc().update({'Flag': true});
                                      // .update
                                      //         .doc(snapshot.data!.docs[index].id.toString())
                                    });
                                  } else {
                                    firestore1.doc().update({'Flag': false});
                                    // update
                                    //     .doc(snapshot.data!.docs[index].id.toString())
                                    //     .update({'Flag': false});
                                    firestore1
                                        .doc(snapshot.data!.docs[index].id
                                            .toString())
                                        .delete();
                                  }
                                },
                              );
                            },
                          ),
                        );
                      }
                      return const Text('Loading');
                    },
                  )
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
