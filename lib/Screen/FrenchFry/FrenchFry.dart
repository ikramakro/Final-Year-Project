import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/UI/Components/ReusebleContainer.dart';

import '../../Model/CartModel.dart';

class FrenchFry extends StatefulWidget {
  const FrenchFry({super.key});

  @override
  State<FrenchFry> createState() => _FrenchFryState();
}

class _FrenchFryState extends State<FrenchFry> {
  final ref = FirebaseFirestore.instance.collection('FrenchFry').snapshots();
  CollectionReference firestore =
      FirebaseFirestore.instance.collection('Favorites');

  List Salecteditem = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('French Fry')),
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
              String Id = DateTime.now().millisecondsSinceEpoch.toString();
              Cart uploadingCart = Cart(
                name: snapshot.data!.docs[index]["Name"].toString(),
                image: snapshot.data!.docs[index]['Image'].toString(),
                price:
                    int.parse(snapshot.data!.docs[index]['Price'].toString()),
                // id: int.parse(snapshot.data!.docs[index]['id']),
              );

              return ReusebleContainer(
                  name: snapshot.data!.docs[index]['Name'],
                  path: snapshot.data!.docs[index]['Image'].toString(),
                  index: index,
                  price: snapshot.data!.docs[index]['Price'],
                  favriteontap: (() {
                    if (Salecteditem.contains(index)) {
                      deleteitem(snapshot.data!.docs[index].id);
                      setState(() {});
                    } else {
                      firestore.doc().set({
                        'Name': uploadingCart.name,
                        "Image": uploadingCart.image,
                        'Price': uploadingCart.price,
                      });
                    }
                    Salecteditem.contains(index)
                        ? Salecteditem.remove(index)
                        : Salecteditem.add(index);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Salecteditem.contains(index)
                            ? Text('${uploadingCart.name} is Added to Favorite')
                            : Text(
                                '${uploadingCart.name} is remove from Favorite')));
                    setState(() {});
                  }),
                  icon: Salecteditem.contains(index)
                      ? Icons.favorite
                      : Icons.favorite_border_outlined);
            },
          );
        },
      ),
    );
  }
}

deleteitem(id) async {
  await FirebaseFirestore.instance.collection('Favorites').doc(id).delete();
}
