import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_design/src/domain/models/productmodel.dart';
import 'package:ui_design/src/presentation/provider/favorite_provider.dart';
import 'package:ui_design/src/presentation/views/card_detals.dart';

class CardsWidget extends StatelessWidget {
  const CardsWidget({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(3.0),
        child: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CardDetals(
                          productsModel: productsModel,
                        ))),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Card(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.44,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Image.network(
                          productsModel.image ?? "",
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //category
                            Text(
                              productsModel.category ?? "",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //price
                                Text(
                                  productsModel.price != null
                                      ? '\$${productsModel.price!.toStringAsFixed(2)}'
                                      : 'Price not available',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xfffe9ba1),
                                      fontWeight: FontWeight.bold),
                                ),
                                Consumer<FavoriteNotifier>(
                                  builder: (context, value, child) =>
                                      IconButton(
                                    icon: Icon(
                                      Icons.favorite_sharp,
                                      color:
                                          value.myList.contains(productsModel)
                                              ? const Color(0xfffe9ba1)
                                              : Colors.grey,
                                    ),
                                    onPressed: () {
                                      if (value.myList
                                          .contains(productsModel)) {
                                        value.removeFavorite(productsModel);
                                      } else {
                                        value.addFavorite( productsModel);
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            )));
  }
}
