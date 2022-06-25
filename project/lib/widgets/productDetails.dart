import 'package:flutter/material.dart';
import '../provider/item_list.dart';

class ProductDetails extends StatelessWidget {
  final Image img;
  final String title;
  final double price;

  const ProductDetails({
    Key? key,
    required this.img,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Card(
        margin: const EdgeInsets.all(0.2),
        child: ListTile(
          leading: CircleAvatar(
            child: img,
          ),
          title: Text(title),
          trailing: Text(price.toString()),
        ),
      ),
    );
  }
}
