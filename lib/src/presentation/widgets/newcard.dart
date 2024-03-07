import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_design/src/presentation/provider/product_provide.dart';

class NewCard extends StatelessWidget {
  const NewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    String imageUrl = "";
final productsProvider = context.watch<ProductsProvider>();

// ignore: unnecessary_null_comparison
if (productsProvider.products != null &&
    productsProvider.products.length > 9) {
  imageUrl = productsProvider.products[9].image ?? "";
} 
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.17,
      child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 9.95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xfffe9ba1)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("NEW" "\n" "ARRIVALS",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 29,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Image.network(
                         imageUrl,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
