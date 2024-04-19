/*
To Do:
- when checking out succesfully,
  - go to mycatalog page
  - show Payment Successful! snackbar

*/

import 'package:flutter/material.dart';
import 'package:decastro_exer6/screen/MyCart.dart';
import 'package:decastro_exer6/screen/MyCatalog.dart';
import 'package:decastro_exer6/screen/Checkout.dart';
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
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
        ),
        primarySwatch: Colors.blue,
      //   primaryColor: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/cart": (context) => const MyCart(),
        "/products": (context) => const MyCatalog(),
        "/checkout": (context) => const Checkout(),
      },
      home: const MyCatalog(),
    );
  }
}
