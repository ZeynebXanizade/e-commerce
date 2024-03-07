import 'package:flutter/material.dart';
import 'package:ui_design/src/domain/models/productmodel.dart';
import 'package:ui_design/src/data/services/service.dart';


class ProductsProvider extends ChangeNotifier {
  final ProductService productService;
  List<ProductsModel> products = [];
  bool isLoading = false;

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ProductsProvider(this.productService) {
    fetch();
  }

  Future<void> fetch() async {
    changeLoading();
    try {
      products = await productService.fetchProductItems() ?? [];
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching products: $e');
      products = [];
    }
    
    changeLoading();
  }
}
