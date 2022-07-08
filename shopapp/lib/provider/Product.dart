import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final String description;
  bool isFavorite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.price,
      this.isFavorite = false});

  Future<void> toogleisFavorite(String token) async {
    bool oldResult = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = Uri.parse(
        'https://arunsshop-972c0-default-rtdb.firebaseio.com/products/$id.json?auth=$token');

    try {
      final responce = await http.patch(url,
          body: json.encode({
            'isFavorite': isFavorite,
          }));
      if (responce.statusCode >= 400) {
        isFavorite = oldResult;
        notifyListeners();
      }
      notifyListeners();
    } catch (error) {
      isFavorite = oldResult;
      notifyListeners();
    }
  }
}
