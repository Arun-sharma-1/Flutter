import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';

class ProductDetails extends StatelessWidget {
  static String routeName = 'product-detail';
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final incomingData = ModalRoute.of(context)!.settings.arguments as String;
    final product = Provider.of<Products>(context)
        .items
        .firstWhere((element) => element.id == incomingData);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            // width: double.infinity,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            product.description,
            style:const  TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                letterSpacing: 1,
                color: Colors.black87),
          ),
          Text(
            '₹ ${product.price.toString()}',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
