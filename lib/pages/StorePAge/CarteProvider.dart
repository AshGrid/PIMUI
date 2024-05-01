import 'package:flutter/material.dart';
import 'package:sneakers_app/pages/StorePAge/models/Market.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cartedItems = [];

  List<Product> get cartedItems => _cartedItems;

  get data => null;

  void addToCart(Product item) {
    _cartedItems.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cartedItems.remove(item);
    notifyListeners();
  }

  double get total {
    double totalPrice = 0;
    for (var item in _cartedItems) {
      totalPrice += double.parse(item.price as String);
    }
    return totalPrice;
  }
}
