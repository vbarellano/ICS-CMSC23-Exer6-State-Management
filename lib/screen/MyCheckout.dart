import 'package:flutter/material.dart';
import '../model/Item.dart';
import "package:provider/provider.dart";
import '../provider/shoppingcart_provider.dart';

class MyCheckout extends StatelessWidget {
  const MyCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
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
        ],
      ),
    );
  }

  Widget getItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    double totalCost = context.watch<ShoppingCart>().cartTotal;
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
              // Display each item
              Expanded(
                  child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(
                            child: Text(
                          products[index].name,
                          textAlign: TextAlign.end,
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child:
                              Text("Php " + products[index].price.toString()),
                        )),
                      ],
                    ),
                  );
                },
              )),

              // Display the total cost
              Text(
                "Total Cost: Php " + totalCost.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),

              // Display buttons
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: ElevatedButton(
                  onPressed: () {
                    // Clear the shopping cart, go back to the product catalog and prompt message
                    context.read<ShoppingCart>().removeAll();
                    Navigator.pop(context);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Payment Successful!"),
                      duration: const Duration(seconds: 2, milliseconds: 100),
                    ));
                  },
                  child: Text("Pay Now!"),
                ),
              ),
            ],
          ));
  }
}
