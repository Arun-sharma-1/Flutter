import 'package:flutter/material.dart';

class CartData {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartData(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartData> _items = {};

  Map<String, CartData> get items {
    return {..._items};
  }

  int get getLength {
    return _items.length;
  }

  void addItems(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingItems) => CartData(
              id: productId,
              title: title,
              quantity: existingItems.quantity + 1,
              price: price));
    } else {
      _items.putIfAbsent(
          productId,
          () =>
              CartData(id: productId, title: title, quantity: 1, price: price));
    }
    notifyListeners();
  }

  double totalAmount(double price, int quantity) {
    var total = 0.0;
    total = price * quantity;
    return total;
  }

  double get totalBill {
    var total = 0.0;
    _items.forEach((key, CartData) {
      total += CartData.price * CartData.quantity;
    });
    return total;
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
