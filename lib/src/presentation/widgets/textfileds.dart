import 'package:flutter/material.dart';
import 'package:ui_design/src/domain/models/productmodel.dart';

class SearchFields extends StatefulWidget {
  final Function(List<ProductsModel>) onSearch;

  const SearchFields({Key? key, required this.onSearch}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchFieldsState createState() => _SearchFieldsState();
}

class _SearchFieldsState extends State<SearchFields> {
  List<ProductsModel> product = [];
   List<ProductsModel> searchResults = [];

  void onQueryChanged(String query) {
    setState(() {
      searchResults = product
          .where((item) => item.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        // Display search results in a ListView
        ListView.builder(
          shrinkWrap: true,
          itemCount: searchResults.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(searchResults[index].title ?? ""),
              // Add onTap to handle item click
              onTap: () {
                // Perform action when an item in search results is clicked
                // ignore: avoid_print
                print("Item clicked: ${searchResults[index].title}");
              },
            );
          },
        ),
      ],
    );
  }
}
