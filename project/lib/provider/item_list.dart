import 'package:flutter/material.dart';

class ItemList {
  final Image img;
  final String title;
  final double price;
  final String id;

  ItemList(
      {required this.img,
      required this.title,
      required this.price,
      required this.id});
}
