import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_design/src/presentation/provider/product_provide.dart';
import 'package:ui_design/src/presentation/views/search.dart';
import 'package:ui_design/src/presentation/widgets/cardswidget.dart';

class AllCards extends StatefulWidget {
  const AllCards({super.key});

  @override
  State<AllCards> createState() => _AllCardsState();
}

class _AllCardsState extends State<AllCards> {
  late ProductsProvider _productsProvider;

  @override
  void initState() {
    super.initState();
    _productsProvider = Provider.of<ProductsProvider>(context, listen: false);

    // _loadData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    try {
      await _productsProvider.fetch();
    } catch (e) {
      // ignore: avoid_print
      print('Error loading data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => SearchPage(
                  posts: _productsProvider.products,
                ),
              ));
            },
          )
        ],
      ),
      body: _productsProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 3),
                itemBuilder: (ctx, i) {
                  return CardsWidget(
                      productsModel: _productsProvider.products[i]);
                },
                itemCount: _productsProvider.products.length,
              ),
            ),
    );
  }
}
