import 'package:flutter/material.dart';
import 'item_list.dart';

class Items with ChangeNotifier {
  List<ItemList> products = [
    ItemList(
        img: Image.asset("assets/food.png"),
        title: 'Food',
        price: 500,
        id: DateTime.now().toString()),
    ItemList(
        img: Image.asset("assets/wine.png"),
        title: 'wine',
        price: 550,
        id: DateTime.now().toString()),
    ItemList(
        img: Image.asset("assets/sports.png"),
        title: 'Sports',
        price: 400,
        id: DateTime.now().toString()),
  ];

  List<ItemList> get itemdetail {
    return [...products];
  }

  double get totalExpances {
    double _total = 0.0;
    itemdetail.forEach((element) {
      _total += element.price;
    });
    return _total;
  }
}
