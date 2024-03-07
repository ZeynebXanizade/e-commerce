import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_design/src/domain/models/productmodel.dart';
import 'package:ui_design/src/presentation/provider/favorite_provider.dart';
import 'package:ui_design/src/presentation/widgets/detalscardwidget.dart';

class CardDetals extends StatefulWidget {
  const CardDetals({
    super.key,
    required this.productsModel,
  });

  final ProductsModel productsModel;

  @override
  State<CardDetals> createState() => _CardDetalsState();
}

class _CardDetalsState extends State<CardDetals> {
  @override
  Widget build(BuildContext context) {
    final widthMedia = MediaQuery.of(context).size.width;
    final heightMedia = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            actions: [
              Consumer<FavoriteNotifier>(
                builder: (context, value, child) => IconButton(
                  icon: Icon(Icons.favorite_sharp,
                      color: value.myList.contains(widget.productsModel)
                          ? const Color(0xfffe9ba1)
                          : Colors.grey),
                  onPressed: () {
                    value.myList.contains(widget.productsModel)
                        ? value.removeFavorite(widget.productsModel)
                        : value.addFavorite(widget.productsModel);
                    
                  },
                ),
              ),
            ],
            bottom: PreferredSize(
                preferredSize: Size(widthMedia * 0.5, heightMedia * 0.3),
                child: Image.network(
                  widget.productsModel.image ?? "",
                  width: widthMedia * 0.5,
                  height: heightMedia * 0.3,
                ))),
        body: DetalsCardWidget(
            productsModel: widget.productsModel,
            widthMedia: widthMedia,
            heightMedia: heightMedia));
  }
}
