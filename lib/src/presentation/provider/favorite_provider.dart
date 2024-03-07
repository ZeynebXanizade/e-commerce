import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_design/src/domain/models/productmodel.dart';

class FavoriteNotifier extends ChangeNotifier {
  final List<ProductsModel> _myList = [];
  List<ProductsModel> get myList => _myList;
  FavoriteNotifier() {
    getShared();
  }
  void addFavorite(ProductsModel productsModel) {
    _myList.add(productsModel);
    notifyListeners();
    setSharedPrefs();
  }

  void removeFavorite(ProductsModel productsModel) {
    _myList.remove(productsModel);
    setSharedPrefs();
    notifyListeners();
  }

  void clearFavorite() {
    _myList.clear();
    setSharedPrefs();
    notifyListeners();
  }

  Future<void> getShared() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? jsonString = prefs.getStringList("favorite_items");
      if (jsonString != null && jsonString.isNotEmpty) {
        _myList.clear();
        _myList.addAll(
            jsonString.map((e) => ProductsModel.fromJson(json.decode(e))));
      }
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print("error $e");
    }
  }

  Future<void> setSharedPrefs() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> jsonString = _myList.map((e) => json.encode(e)).toList();
      await prefs.setStringList("favorite_items", jsonString);
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print("error set $e");
    }
  }
}
