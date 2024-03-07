import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_design/src/domain/models/basketmodel.dart';
import 'dart:convert';

class BasketNotifier extends ChangeNotifier {
  final List<CartItem?> _items = [];
  List<CartItem?> get items => _items;
  BasketNotifier() {
    getSharedPreferences();
  }
  //sebete eklenenlerin toplam fiyati
  double get totalAmount {
    double total = 0.0;
    // ignore: avoid_function_literals_in_foreach_calls
    _items.forEach((element) {
      total += element!.totalPrice;
    });
    getSharedPreferences();
    return total;
  }

  //sebete 1 urun ekleyen metod
  void addItem(int id, String title, int quantity, String image, double price) {
    try {
      var existingItem = _items.firstWhere(
        (element) => element != null ? (element.id == id) : false,
        orElse: () => null,
      );

      if (existingItem != null) {
        existingItem.incrementQuantity();
      } else {
        var newItem = CartItem(title, 1, id, price, image);
        _items.add(newItem);
      }

      setSharedPreferences();
    } catch (e, stackTrace) {
      // ignore: avoid_print
      print('Error in addItem: $e');
      // ignore: avoid_print
      print('Stack trace: $stackTrace');
    }
    notifyListeners();
  }

  //sebetden urun cikaran
  void removeItem(int id) {
    // Sepette aynı id'ye sahip bir ürün varsa, adedini azalt
    var existingItem =
        _items.firstWhere((item) => item!.id == id, orElse: () => null);
    if (existingItem != null) {
      existingItem.decrementQuantity();
      // Eğer adet sıfıra düşerse, ürünü sepetten sil
      if (existingItem.quantity == 0) {
        _items.remove(existingItem);
      }
    }
    setSharedPreferences();
    // Değişikliği bildir
    notifyListeners();
  }

  // Sepetten bir ürünü tamamen silen metod
  void clearItem(int id) {
    // Sepette aynı id'ye sahip bir ürün varsa, sepetten sil
    var existingItem =
        _items.firstWhere((item) => item!.id == id, orElse: () => null);
    if (existingItem != null) {
      _items.remove(existingItem);
    }
    setSharedPreferences();
    notifyListeners();
  }

  // Sepeti tamamen boşaltan metod
  void clearCart() {
    _items.clear();
    setSharedPreferences();
    notifyListeners();
  }

  Future<void> setSharedPreferences() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> jsonStringList =
          _items.map((e) => json.encode(e!.toJson())).toList();
      await prefs.setStringList("cart_items", jsonStringList);
      notifyListeners(); // Check if this is causing unexpected rebuilds
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> getSharedPreferences() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? jsonStringList = prefs.getStringList("cart_items");
      if (jsonStringList != null && jsonStringList.isNotEmpty) {
        _items.clear();
        _items.addAll(
          jsonStringList.map((e) => CartItem.fromJson(json.decode(e))),
        );
      }
      // notifyListeners(); // Comment out for now, observe if this is causing the loop
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
