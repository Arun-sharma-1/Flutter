import 'package:flutter/material.dart';

class ItemList {
  final Image img;
  final String title;
  final double price;
  final String id;
  final String category;
  final String remark;
  final DateTime date;

  ItemList(
      {required this.img,
      required this.date,
      this.category = 'Expences',
      required this.remark,
      required this.title,
      required this.price,
      required this.id});
}
