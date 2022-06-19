import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  static String routeName = 'product-detail';
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final incomingData = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(incomingData),
      ),
    );
  }
}
