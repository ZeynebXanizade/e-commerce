// import 'package:dio/dio.dart';
// import 'package:ui_design/src/constants/loading.dart';
// import 'package:ui_design/src/domain/models/productmodel.dart';
// import 'package:ui_design/src/presentation/widgets/card.dart';
// import 'package:ui_design/src/services/service.dart';

// abstract class ProductViewModel extends LoadingStateful<Cards> {
//   late final ProductService productService;
//   List<ProductsModel> products = [];
//   @override
//   void initState() {
//     super.initState();
//     productService =
//         ProductServices(Dio(BaseOptions(baseUrl: "https://fakestoreapi.com")));
//         fetch();
//   }

//   Future<void> fetch() async {
//     changeLoading();
//     products = await productService.fetchProductItems() ?? [];
//     changeLoading();
//   }
// }
