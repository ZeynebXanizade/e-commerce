import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_design/src/presentation/provider/favorite_provider.dart';


class FavoritedPage extends StatefulWidget {
  const FavoritedPage({super.key});

  @override
  State<FavoritedPage> createState() => _FavoritedPageState();
}

class _FavoritedPageState extends State<FavoritedPage> {
  @override
  Widget build(BuildContext context) {
    var myList = context.watch<FavoriteNotifier>().myList;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 226, 226),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
               
              },
              icon: const Icon(
                Icons.delete,
                size: 20,
                color: Color(0xfffe9ba1),
              ))
        ],
        title: Text(
          " Favorite : ${myList.length}",
          style: const TextStyle(color: Color(0xfffe9ba1)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: ListView.builder(
                      itemCount: myList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Card(
                              child: ListTile(
                                title: Text(myList[index].title ?? ""),
                                subtitle: Text(myList[index].price != null
                                    ? "\$${myList[index].price!.toStringAsFixed(2)}"
                                    : "Price not"),
                                leading:
                                    Image.network(myList[index].image ?? ""),
                                trailing: IconButton(
                                    onPressed: () {
                                      context
                                          .read<FavoriteNotifier>()
                                          .removeFavorite(myList[index]);
                                    },
                                    icon: const Icon(Icons.delete)),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
