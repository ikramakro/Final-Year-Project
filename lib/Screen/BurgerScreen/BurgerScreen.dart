import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/DetialScreen.dart';
import 'package:fyp/Model/CartModel.dart';
import 'package:fyp/UI/Components/ReusebleContainer.dart';

class BurgerScreen extends StatefulWidget {
  const BurgerScreen({super.key});

  @override
  State<BurgerScreen> createState() => _BurgerScreenState();
}

class _BurgerScreenState extends State<BurgerScreen> {
  final ref = FirebaseFirestore.instance.collection('Burger').snapshots();
  final firestore = FirebaseFirestore.instance.collection('Favorites');
  final update = FirebaseFirestore.instance.collection('Burger');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Burger Screen')),
      body: StreamBuilder<QuerySnapshot>(
        stream: ref,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) return const Text('Some Error');
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 220,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              Cart(
                name: snapshot.data!.docs[index]['Name'],
                image: snapshot.data!.docs[index]['Image'].toString(),
                price: snapshot.data!.docs[index]['Price'],
              );
              return ReusebleContainer(
                name: snapshot.data!.docs[index]['Name'],
                path: snapshot.data!.docs[index]['Image'].toString(),
                index: index,
                price: snapshot.data!.docs[index]['Price'],
                favriteontap: () {
                  if (snapshot.data!.docs[index]['Flag'] == false) {
                    firestore
                        .doc(snapshot.data!.docs[index].id.toString())
                        .set({
                      'Name': snapshot.data!.docs[index]['Name'],
                      'Image': snapshot.data!.docs[index]['Image'].toString(),
                      'Price': snapshot.data!.docs[index]['Price'],
                    }).then((value) {
                      update
                          .doc(snapshot.data!.docs[index].id.toString())
                          .update({'Flag': true});
                    });
                  } else {
                    update
                        .doc(snapshot.data!.docs[index].id.toString())
                        .update({'Flag': false});
                    firestore
                        .doc(snapshot.data!.docs[index].id.toString())
                        .delete();
                  }
                },
                icon: snapshot.data!.docs[index]['Flag'] == true
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemDetailScreen(
                              image: snapshot.data!.docs[index]['Image']
                                  .toString(),
                              name: snapshot.data!.docs[index]['Name'],
                              des: snapshot.data!.docs[index]['Des'],
                              price: snapshot.data!.docs[index]['Price'])));
                },
              );
            },
          );
        },
      ),
    );
  }
}
