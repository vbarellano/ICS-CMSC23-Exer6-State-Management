import 'package:flutter/material.dart';
import 'screen/MyCart.dart';
import 'screen/MyCatalog.dart';
import 'screen/MyCheckout.dart';
import 'package:provider/provider.dart';
import 'provider/shoppingcart_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ShoppingCart()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        // Route for Cart
        "/cart": (context) => const MyCart(),
        // Route for Products Catalog
        "/products": (context) => const MyCatalog(),
        // Route for Checkout
        "/checkout": (context) => const MyCheckout(),
      },
      home: const MyCatalog(),
    );
  }
}
