import 'package:flutter/material.dart';
import '../model/Item.dart';
import "package:provider/provider.dart";
import '../provider/shoppingcart_provider.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Shopping Cart")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Item Details
          Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: const Text(
                "Item Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          // Call this to display the content of shopping cart
          getItems(context),
          Container(
              padding: const EdgeInsets.all(50),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Reset Button
                    ElevatedButton(
                        onPressed: () {
                          context.read<ShoppingCart>().removeAll();
                        },
                        child: const Text("Reset")),
                    // Checkout Button
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/checkout");
                        },
                        child: const Text("Checkout"))
                  ])),
        ],
      ),
    );
  }

  Widget getItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    String productname = "";
    return products.isEmpty

        // Display this if empty cart
        ? const Flexible(
            child: Center(
            child: Text('No Items yet!'),
          ))

        // Display this if the cart is not empty
        : Expanded(
            child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.food_bank),
                    title: Text(products[index].name),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        productname = products[index].name;
                        context.read<ShoppingCart>().removeItem(productname);

                        if (products.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("$productname removed!"),
                            duration:
                                const Duration(seconds: 1, milliseconds: 100),
                          ));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Cart Empty!"),
                            duration: Duration(seconds: 1, milliseconds: 100),
                          ));
                        }
                      },
                    ),
                  );
                },
              )),
            ],
          ));
  }
}
