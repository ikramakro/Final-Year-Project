import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/UI/Components/ReusebleContainer.dart';

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
  final ref = FirebaseFirestore.instance.collection('HotWings').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HotWings Screen')),
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
              return ReusebleContainer(
                name: snapshot.data!.docs[index]['Name'],
                path: snapshot.data!.docs[index]['Image'].toString(),
                index: index,
                price: snapshot.data!.docs[index]['Price'],
              );
            },
          );
        },
      ),
    );
  }
}
