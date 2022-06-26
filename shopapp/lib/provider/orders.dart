import 'package:flutter/material.dart';
import 'cart_data.dart';

class OrderItem {
  final String id;
  final double totalAmount;
  final List<CartData> products;
  final DateTime dateTime;

  OrderItem(
      {required this.id,
      required this.totalAmount,
      required this.products,
      required this.dateTime});
}

class Order with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(final List<CartData> products, double Total) {
    _orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            totalAmount: Total,
            products: products,
            dateTime: DateTime.now()));
    notifyListeners();
  }

}
