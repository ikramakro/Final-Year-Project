import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Cartprovider.dart';
import 'package:fyp/Util/Colors.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final ref = FirebaseFirestore.instance.collection('CartData').snapshots();
  final cart = FirebaseFirestore.instance.collection('CartData');
  @override
  Widget build(BuildContext context) {
    final cartprovider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder(
            stream: ref,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Divider(
                            color: Colors.amber,
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Image.network(
                                      snapshot.data!.docs[index]['Image'])),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      snapshot.data!.docs[index]['Name'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "\$ ${snapshot.data!.docs[index]['Price']}",
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              int quantity = snapshot.data!
                                                  .docs[index]['Quantity'];

                                              int price = int.parse(snapshot
                                                  .data!.docs[index]['Price']);
                                              quantity--;
                                              int newPrice = quantity * price;
                                              final total = cartprovider
                                                  .addTotalPrice(newPrice);
                                              quantity--;
                                              final cart = FirebaseFirestore
                                                  .instance
                                                  .collection('CartData');
                                              cart
                                                  .doc(snapshot
                                                      .data!.docs[index].id)
                                                  .update(
                                                      {"Quantity": quantity});
                                            },
                                            icon: const Icon(Icons.remove)),
                                        Text(
                                          snapshot.data!.docs[index]['Quantity']
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              int quantity = snapshot.data!
                                                  .docs[index]['Quantity'];

                                              int price = int.parse(snapshot
                                                  .data!.docs[index]['Price']);

                                              int newPrice = quantity * price;
                                              final total = cartprovider
                                                  .addTotalPrice(newPrice);
                                              quantity++;
                                              final cart = FirebaseFirestore
                                                  .instance
                                                  .collection('CartData');
                                              cart
                                                  .doc(snapshot
                                                      .data!.docs[index].id)
                                                  .update(
                                                      {"Quantity": quantity});
                                            },
                                            icon: const Icon(Icons.add)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  cartprovider.removeCounter();
                                  cartprovider.removeTotalprice(int.parse(
                                      snapshot.data!.docs[index]["Price"]));
                                  cart
                                      .doc(snapshot.data!.docs[index].id)
                                      .delete();
                                },
                                icon: const Icon(Icons.remove),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.Maincolor),
                                ),
                              )
                            ],
                          ),
                          const Divider(
                            color: Colors.amber,
                            thickness: 1,
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          )),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Consumer<CartProvider>(
                      builder: (context, value, child) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Text(
                            "Rs :-  ${value.getTotalprice().toString()}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  child: const Text('Checkout'),
                  onPressed: () {
                    // Perform checkout
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
