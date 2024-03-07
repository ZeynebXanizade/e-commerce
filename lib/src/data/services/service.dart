import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ui_design/src/domain/models/productmodel.dart';

abstract class ProductService {
  final Dio dio;
  ProductService(this.dio);
  Future<List<ProductsModel>?> fetchProductItems();
}

class ProductServices extends ProductService {
  ProductServices(Dio dio) : super(dio);
  @override
  Future<List<ProductsModel>?> fetchProductItems() async {
    try {
      final response = await dio.get("/products");
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is List) {
          final products = jsonBody
              .map<ProductsModel>((e) => ProductsModel.fromJson(e))
              .toList();
          return products;
        }
        
      }
      // ignore: empty_catches
    } catch (e) {}
    return null;
  }
}
