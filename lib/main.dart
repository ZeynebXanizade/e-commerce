

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_design/src/data/services/service.dart';
import 'package:ui_design/src/domain/models/productmodel.dart';
import 'package:ui_design/src/presentation/provider/basket_provider.dart';
import 'package:ui_design/src/presentation/provider/favorite_provider.dart';
import 'package:ui_design/src/presentation/provider/product_provide.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ui_design/src/presentation/widgets/tabbar.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  Stripe.publishableKey =
      "pk_test_51Oo2RrBL64c1fQmaNcOwtthZuumph2YHV5KX3dwCce6i9oTx5vonbe7qxx9dXO7JflTrCh1QhEmg43n8xkVdQSy500fvZEpd6n";
  var basketNotifier = BasketNotifier();
  runApp(MyApp(basketNotifier: basketNotifier));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key, required this.basketNotifier});
  final BasketNotifier basketNotifier;
  @override
  Widget build(BuildContext context) {
   
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteNotifier>(
            create: (_) => FavoriteNotifier()),
        ChangeNotifierProvider<ProductsProvider>(
            create: (_) => ProductsProvider(ProductServices(
                Dio(BaseOptions(baseUrl: "https://fakestoreapi.com"))))),
        ChangeNotifierProvider<BasketNotifier>(create: (_) => basketNotifier)
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
         
          home: TabBarPage()),
    );
  }
}
