import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/UI/Components/ReusebleContainer.dart';

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({super.key});

  @override
  State<PizzaScreen> createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {
  final ref = FirebaseFirestore.instance.collection('Pizza').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pizza Screen')),
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
