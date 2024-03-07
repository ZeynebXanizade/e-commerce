import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_design/src/domain/models/productmodel.dart';
import 'package:ui_design/src/presentation/provider/basket_provider.dart';
import 'package:ui_design/src/presentation/views/basket.dart';

class DetalsCardWidget extends StatefulWidget {
  const DetalsCardWidget({
    super.key,
    required this.productsModel,
    required this.widthMedia,
    required this.heightMedia,
  });

  final ProductsModel productsModel;
  final double widthMedia;
  final double heightMedia;

  @override
  State<DetalsCardWidget> createState() => _DetalsCardWidgetState();
}

class _DetalsCardWidgetState extends State<DetalsCardWidget> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<BasketNotifier>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.productsModel.category ?? "",
                    style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Text(
                    // ignore: unnecessary_null_comparison
                    widget.productsModel.price != null
                        ? '\$${widget.productsModel.price}'
                        : 'Price not available',
                    style: const TextStyle(
                        fontSize: 23,
                        color: Color(0xfffe9ba1),
                        fontWeight: FontWeight.bold))
              ],
            ),
            Text(widget.productsModel.title ?? "",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.blueGrey,
                )),
            Text(widget.productsModel.description ?? "",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                  width: widget.widthMedia * 0.9,
                  height: widget.heightMedia * 0.09,
                  child: ElevatedButton(
                      onPressed: () {
                        product.addItem(
                            widget.productsModel.id ?? 0,
                            widget.productsModel.title ?? "",
                            1,
                            widget.productsModel.image ?? "",
                            widget.productsModel.price ?? 0);
                        BasketNotifier().setSharedPreferences();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            action: SnackBarAction(
                                label: "Okay",
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BasketPage()));
                                }),
                            backgroundColor: const Color(0xfffe9ba1),
                            content: const Text(
                              "Added to cart",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )));
                      },
                      child: const Text("Add to cart",
                          style: TextStyle(
                              fontSize: 23,
                              color: Color(0xfffe9ba1),
                              fontWeight: FontWeight.bold)))),
            )
          ],
        ),
      ),
    );
  }
}
