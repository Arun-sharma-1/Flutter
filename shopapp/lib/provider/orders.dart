import 'package:flutter/material.dart';
import 'cart_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  final String token;
  Order(this.token, this._orders);
  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    final url = Uri.parse(
        'https://arunsshop-972c0-default-rtdb.firebaseio.com/orders.json?auth=$token');
    final response = await http.get(url);
    final List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(
        OrderItem(
          id: orderId,
          totalAmount: orderData['amount'],
          dateTime: DateTime.parse(orderData['dateTime']),
          products: (orderData['products'] as List<dynamic>)
              .map(
                (item) => CartData(
                  id: item['id'],
                  price: item['price'],
                  quantity: item['quantity'],
                  title: item['title'],
                ),
              )
              .toList(),
        ),
      );
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(final List<CartData> products, double Total) async {
    final timeStamp = DateTime
        .now(); // so that we can get same time when product is added to app and added to server
    final url = Uri.parse(
        'https://arunsshop-972c0-default-rtdb.firebaseio.com/orders.json?auth=$token');
    final responce = await http.post(url,
        body: json.encode({
          'amount': Total,
          'dateTime': timeStamp.toIso8601String(),
          'products': products
              .map((cp) => {
                    'id': cp.id,
                    'title': cp.title,
                    'quantity': cp.quantity,
                    'price': cp.price
                  })
              .toList(),
        }));
    _orders.insert(
        0,
        OrderItem(
            id: json.decode(responce.body)['name'],
            totalAmount: Total,
            products: products,
            dateTime: timeStamp));
    notifyListeners();
  }
}
