// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        ListTile(
                          title: Text("Item 1"),
                          subtitle: Text("\$10"),
                        ),
                        ListTile(
                          title: Text("Item 2"),
                          subtitle: Text("\$20"),
                        ),
                        // ...
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        ListTile(
                          title: Text("Shipping"),
                          subtitle: Text("\$5"),
                        ),
                        ListTile(
                          title: Text("Tax"),
                          subtitle: Text("\$2"),
                        ),
                        // ...
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        ListTile(
                          title: Text("Total"),
                          subtitle: Text("\$37"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Shipping Address",
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Billing Address",
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const Text("Place Order"),
                  onPressed: () {
                    // Place order
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
