// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_design/src/presentation/provider/basket_provider.dart';
import 'package:ui_design/src/presentation/views/pay.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    var product = Provider.of<BasketNotifier>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 226, 226),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.66,
                  child: ListView.builder(
                      itemCount: product.items.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Card(
                              child: ListTile(
                                  title: Text(product.items[index]!.title),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(product.items[index]!.price != null
                                          ? "\$${product.items[index]!.price.toStringAsFixed(2)}"
                                          : "Price not"),
                                      Row(
                                        children: [
                                          //artma
                                          IconButton(
                                            icon: const Icon(
                                              Icons.add,
                                              color: Color(0xfffe9ba1),
                                            ),
                                            onPressed: () {
                                              product.addItem(
                                                product.items[index]!.id,
                                                product.items[index]!.title,
                                                product.items[index]!.quantity,
                                                product.items[index]!.image,
                                                product.items[index]!.price,
                                              );
                                            },
                                          ),
                                          //deyer
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.07,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xfffe9ba1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Center(
                                                  child: Text(
                                                product.items[index]!
                                                            .quantity !=
                                                        null
                                                    ? "${product.items[index]!.quantity}"
                                                    : "0",
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ))),

                                          //azalma
                                          IconButton(
                                              onPressed: () {
                                                product.removeItem(
                                                    product.items[index]!.id);
                                              },
                                              icon: const Icon(
                                                Icons.remove,
                                                color: Color(0xfffe9ba1),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                  leading: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height: MediaQuery.of(context).size.height *
                                        0.09,
                                    child: Image.network(
                                        product.items[index]!.image),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        product.clearItem(
                                            product.items[index]!.id);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        size: 20,
                                        color: Color(0xfffe9ba1),
                                      ))),
                            ),
                          ],
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total",
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold)),
                      Text(
                          product.totalAmount != null
                              ? '\$${product.totalAmount.toStringAsFixed(2)}' // İki ondalık basamak için
                              : 'Price not available',
                          style: const TextStyle(
                              fontSize: 23,
                              color: Color(0xfffe9ba1),
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const PayMent(),
                    //all
                    TextButton(
                      onPressed: () {
                        product.clearCart();
                      },
                      child: const Icon(
                        Icons.delete_outline_sharp,
                        color: Color(0xfffe9ba1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
