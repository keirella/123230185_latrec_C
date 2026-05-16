import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/cart_model.dart';

class CartPage extends StatelessWidget {

  final String username;

  CartPage({
    super.key,
    required this.username,
  });

  final Box<CartItem> cartBox =
      Hive.box<CartItem>('cartBox');

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Cart"),
      ),

      body: ValueListenableBuilder(

        valueListenable:
            cartBox.listenable(),

        builder:
            (context, Box<CartItem> box, _) {

          final userCart = box.values
              .where(
                (item) =>
                    item.username ==
                    username,
              )
              .toList();

          double total = 0;

          for (var item in userCart) {
            total += item.price * item.qty;
          }

          if (userCart.isEmpty) {

            return const Center(
              child: Text("Cart kosong"),
            );

          }

          return Column(

            children: [

              Expanded(

                child: ListView.builder(

                  itemCount: userCart.length,

                  itemBuilder:
                      (context, index) {

                    final item =
                        userCart[index];

                    return Card(

                      elevation: 4,

                      margin:
                          const EdgeInsets.all(10),

                      child: ListTile(

                        leading: Image.network(
                          item.thumbnail,
                          width: 60,
                        ),

                        title: Text(item.title),

                        subtitle: Text(
                          "Qty: ${item.qty}\\nTotal: \$${item.price * item.qty}",
                        ),

                        trailing:
                            IconButton(

                          onPressed: () {
                            item.delete();
                          },

                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              Container(

                width: double.infinity,

                padding:
                    const EdgeInsets.all(20),

                child: Text(

                  "Total Harga: \$${total.toStringAsFixed(2)}",

                  textAlign: TextAlign.center,

                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}