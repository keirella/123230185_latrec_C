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
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    final stock = widget.product['stock'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF4A1525)),
        title: Text(
          widget.product['title'],
          style: const TextStyle(color: Color(0xFF4A1525), fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8FA),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.network(
                  widget.product['thumbnail'],
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.product['title'],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A1525),
                          ),
                        ),
                      ),
                      Text(
                        "\$${widget.product['price']}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF4081),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEFF4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Stock: $stock tersedia",
                      style: const TextStyle(color: Color(0xFFFF4081), fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Deskripsi Produk",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4A1525)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.product['description'],
                    style: TextStyle(color: Colors.grey.shade600, height: 1.5, fontSize: 14),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Jumlah Pembelian",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4A1525)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF8FA),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFFFD0E0)),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (qty > 1) {
                                  setState(() {
                                    qty--;
                                  });
                                }
                              },
                              icon: const Icon(Icons.remove, color: Color(0xFFFF4081)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                qty.toString(),
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if (qty < stock) {
                                  setState(() {
                                    qty++;
                                  });
                                }
                              },
                              icon: const Icon(Icons.add, color: Color(0xFFFF4081)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        final box = Hive.box<CartItem>('cartBox');
                        box.add(
                          CartItem(
                            username: widget.username,
                            id: widget.product['id'],
                            title: widget.product['title'],
                            price: widget.product['price'].toDouble(),
                            thumbnail: widget.product['thumbnail'],
                            qty: qty,
                            stock: stock,
                          ),
                        );
                        Get.snackbar(
                          "Berhasil ✨",
                          "Produk telah ditambahkan ke keranjang",
                          backgroundColor: const Color(0xFFFFEFF4),
                          colorText: const Color(0xFFD81B60),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF4081),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}