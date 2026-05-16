import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/api_services.dart';
import 'cart_page.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {

  final String username;

  const HomePage({
    super.key,
    required this.username,
  });

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState
    extends State<HomePage> {

  List products = [];
  List filteredProducts = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    fetchProducts();
  }

  void fetchProducts() async {

    final data =
        await ApiService.getProducts();

    setState(() {

      products = data;
      filteredProducts = data;
      isLoading = false;

    });
  }

  void searchProduct(String value) {

    final result = products.where((product) {

      final title = product['title']
          .toString()
          .toLowerCase();

      return title.contains(
        value.toLowerCase(),
      );

    }).toList();

    setState(() {
      filteredProducts = result;
    });
  }

  @override
  Widget build(BuildContext context) {

    final width =
        MediaQuery.of(context).size.width;

    int crossAxisCount = 2;

    if (width > 900) {
      crossAxisCount = 4;
    } else if (width > 600) {
      crossAxisCount = 3;
    }

    return Scaffold(

      appBar: AppBar(

        title: Text(
          "Halo ${widget.username}",
        ),

        actions: [

          IconButton(

            onPressed: () {

              Get.to(
                () => CartPage(
                  username: widget.username,
                ),
              );

            },

            icon: const Icon(
              Icons.shopping_cart,
            ),
          )
        ],
      ),

      body: isLoading

          ? const Center(
              child:
                  CircularProgressIndicator(),
            )

          : Padding(
              padding:
                  const EdgeInsets.all(12),

              child: Column(

                children: [

                  TextField(

                    onChanged: searchProduct,

                    decoration: InputDecoration(

                      hintText:
                          "Cari produk...",

                      prefixIcon:
                          const Icon(
                        Icons.search,
                      ),

                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Expanded(

                    child: GridView.builder(

                      itemCount:
                          filteredProducts.length,

                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(

                        crossAxisCount:
                            crossAxisCount,

                        childAspectRatio: 0.72,

                        crossAxisSpacing: 10,

                        mainAxisSpacing: 10,
                      ),

                      itemBuilder:
                          (context, index) {

                        final product =
                            filteredProducts[index];

                        return InkWell(

                          onTap: () {

                            Get.to(
                              () => DetailPage(
                                product: product,
                                username:
                                    widget.username,
                              ),
                            );

                          },

                          child: Card(

                            elevation: 4,

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                15,
                              ),
                            ),

                            child: Padding(

                              padding:
                                  const EdgeInsets.all(
                                10,
                              ),

                              child: Column(

                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,

                                children: [

                                  Expanded(

                                    child: ClipRRect(

                                      borderRadius:
                                          BorderRadius.circular(
                                        12,
                                      ),

                                      child:
                                          Image.network(
                                        product[
                                            'thumbnail'],

                                        width:
                                            double.infinity,

                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                      height: 10),

                                  Text(

                                    product['title'],

                                    maxLines: 2,

                                    overflow:
                                        TextOverflow
                                            .ellipsis,

                                    style:
                                        const TextStyle(
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(
                                      height: 5),

                                  Text(
                                    "\$${product['price']}",

                                    style:
                                        const TextStyle(
                                      color: Colors.blue,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
    );
  }
}