import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/UI/Components/ReusebleContainer.dart';

class BurgerScreen extends StatefulWidget {
  const BurgerScreen({super.key});

  @override
  State<BurgerScreen> createState() => _BurgerScreenState();
}

class _BurgerScreenState extends State<BurgerScreen> {
  final ref = FirebaseFirestore.instance.collection('Burger').snapshots();
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
