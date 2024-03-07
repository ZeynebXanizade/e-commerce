import 'package:ui_design/src/presentation/provider/basket_provider.dart';

class CartItem {
  final int id;
  final double price;
  final String image;
  int quantity;
  final String title;

  CartItem(this.title, this.quantity, this.id, this.price, this.image);
  //toplam fiyat
  double get totalPrice {
     BasketNotifier().setSharedPreferences();
    return price * quantity;
    
  }

  //
  void incrementQuantity() {
    quantity++;
    BasketNotifier().setSharedPreferences();
  }

  void decrementQuantity() {
    quantity--;
    BasketNotifier().setSharedPreferences();
  }

  // Convert CartItem to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price': price,
      'image': image,
      'quantity': quantity,
      'title': title,
    };
  }

  // Create CartItem from JSON
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      json['title'] as String,
      json['quantity'] as int,
      json['id'] as int,
      json['price'] as double,
      json['image'] as String,
    );
  }
}
