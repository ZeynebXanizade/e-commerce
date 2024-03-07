import 'package:flutter/material.dart';
import 'package:ui_design/src/domain/models/productmodel.dart';
import 'package:ui_design/src/presentation/widgets/cardswidget.dart';

class SearchPage extends StatefulWidget {
  final List<ProductsModel> posts;

  // ignore: use_key_in_widget_constructors
  const SearchPage({required this.posts});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ProductsModel> _searchedPost = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style:const TextStyle(color: Colors.black),
          decoration:const InputDecoration(
              hintText: 'Search Post',
              hintStyle: TextStyle(color: Colors.black),
              border: InputBorder.none),
          onChanged: (val) {
            setState(() {
              _searchedPost = widget.posts
                  .where((el) => el.category!.contains(val))
                  .toList();
            });
          },
        ),
      ),
      body: _searchedPost.isEmpty
          ? const Center(
              child: Text(
                'No match',
                style: TextStyle(fontSize: 30),
              ),
            )
          : GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 3),
              itemCount: _searchedPost.length,
              itemBuilder: (ctx, i) {
                return CardsWidget(productsModel: _searchedPost[i]);
              },
            ),
    );
  }
}
