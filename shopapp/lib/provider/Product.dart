import 'package:flutter/material.dart';
class Product with ChangeNotifier{
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

  void toogleisFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
