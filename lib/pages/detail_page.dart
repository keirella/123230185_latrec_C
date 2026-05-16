import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../models/cart_model.dart';

class DetailPage extends StatefulWidget {

  final dynamic product;
  final String username;

  const DetailPage({
    super.key,
    required this.product,
    required this.username,
  });

  @override
  State<DetailPage> createState() =>
      _DetailPageState();
}

class _DetailPageState
    extends State<DetailPage> {

  int qty = 1;

  @override
  Widget build(BuildContext context) {

    final stock = widget.product['stock'];

    return Scaffold(

      appBar: AppBar(
        title: Text(widget.product['title']),
      ),

      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              ClipRRect(

                borderRadius:
                    BorderRadius.circular(20),

                child: Image.network(
                  widget.product['thumbnail'],
                ),
              ),

              const SizedBox(height: 20),

              Text(
                widget.product['title'],

                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(widget.product['description']),

              const SizedBox(height: 15),

              Text(
                "Harga: \$${widget.product['price']}",

                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Stock: $stock",
              ),

              const SizedBox(height: 20),

              Row(

                children: [

                  IconButton(

                    onPressed: () {

                      if (qty > 1) {

                        setState(() {
                          qty--;
                        });

                      }
                    },

                    icon: const Icon(Icons.remove),
                  ),

                  Text(
                    qty.toString(),
                    style:
                        const TextStyle(fontSize: 18),
                  ),

                  IconButton(

                    onPressed: () {

                      if (qty < stock) {

                        setState(() {
                          qty++;
                        });

                      }
                    },

                    icon: const Icon(Icons.add),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              SizedBox(

                width: double.infinity,

                child: ElevatedButton(

                  onPressed: () {

                    final box =
                        Hive.box<CartItem>('cartBox');

                    box.add(

                      CartItem(
                        username: widget.username,
                        id: widget.product['id'],
                        title:
                            widget.product['title'],
                        price:
                            widget.product['price']
                                .toDouble(),
                        thumbnail:
                            widget.product['thumbnail'],
                        qty: qty,
                        stock: stock,
                      ),
                    );

                    Get.snackbar(
                      "Berhasil",
                      "Produk masuk cart",
                    );
                  },

                  child:
                      const Text("Add to Cart"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}