import 'package:flutter/material.dart';
import '../model/Item.dart';
import "package:provider/provider.dart";
import "../provider/shoppingcart_provider.dart";

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
    Widget build(BuildContext context) {
      List<Item> products = context.watch<ShoppingCart>().cart;
      return Scaffold(
        appBar: AppBar(title: const Text("Checkout")),
        body: products.isEmpty ? Column(children: [   // if empty
          const Text("Item Details"),
          Divider(height: 1, color: Colors.grey[300]),
          const Text('No Items yet!')
        ])
        : Column(     // if not empty
          children: [
            const Text("Item Details"),
            Divider(height: 1, color: Colors.grey[300]),
            getCheckoutItems(products),
            Divider(height: 1, color: Colors.grey[300]),
            computeCost(),
            Flexible(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                        // Navigator.popUntil(context, ModalRoute.withName('/'));
                      },
                      child: const Text("Pay Now!")),
                  ],
              ),
            ),
            ]
        ),
      );
    }

    Widget getCheckoutItems(List<Item> products) {
      return Expanded(
                child: Column(
                children: [
                  Flexible(
                      child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(products[index].name),
                          trailing: Text(products[index].price.toStringAsFixed(2)),
                          leadingAndTrailingTextStyle: const TextStyle(fontSize: 14.0),
                      );
                    },
                  )),
                  ],
                ));
  }
}

Widget computeCost() {
    return Consumer<ShoppingCart>(builder: (context, cart, child) {
       return Text("Total Cost to Pay: ${cart.cartTotal.toStringAsFixed(2)}");
    });
  }
