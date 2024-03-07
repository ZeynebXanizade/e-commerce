import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_design/src/presentation/provider/product_provide.dart';
import 'package:ui_design/src/presentation/widgets/cardswidget.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: context.read<ProductsProvider>().isLoading
          ? const Center(child: CircularProgressIndicator())
          : const CardWidget(),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provi = context.watch<ProductsProvider>().products;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1.1,
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: provi.length,
          itemBuilder: (context, index) {
            return CardsWidget(
              productsModel: provi[index],
            );
          }),
    );
  }
}
