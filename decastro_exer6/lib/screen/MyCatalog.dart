import 'package:flutter/material.dart';
import '../model/Item.dart';
import "package:provider/provider.dart";
import '../provider/shoppingcart_provider.dart';

class MyCatalog extends StatefulWidget {
  static String routename = "/products";
  const MyCatalog({super.key});

  @override
  State<MyCatalog> createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  List<Item> productsCatalog = [
    Item("Shampoo", 10.00, 2),
    Item("Soap", 12, 3),
    Item("Toothpaste", 40, 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("My Catalog")),
        body: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.star),
                title: Text(
                    "${productsCatalog[index].name} - ${productsCatalog[index].price}"),
                trailing: TextButton(
                  child: const Text("Add"),
                  onPressed: () {
                    context
                        .read<ShoppingCart>()
                        .addItem(productsCatalog[index]);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${productsCatalog[index].name} added!"),
                      duration: const Duration(seconds: 1, milliseconds: 100),
                    ));
                  },
                ),
              );
            },
            itemCount: productsCatalog.length),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.shopping_cart),
          onPressed: () async {
            // method: pop twice from checkout, returning true as the argument
            // will check for the argument value here and show snackbar if true
            // make the 2 onPressed containing pushNamed async

            final isPaymentSuccessful = await Navigator.pushNamed(context, "/cart");
            if(isPaymentSuccessful == true) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Payment Successful!"),
                duration: Duration(seconds: 1, milliseconds: 100),
              ));
            }
          },
        ));
  }
}
