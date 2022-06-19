import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  static String routeName = 'productitem';
  // final String id;
  // final String title;
  // final String imgUrl;

  // const ProductItem(
  //     {Key? key, required this.id, required this.title, required this.imgUrl})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (_) =>ProductDetailScreen(title:title) ));
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                  arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer<Product>(
                builder: ((ctx, product, child) => IconButton(
                      icon: Icon(product.isFavorite
                          ? Icons.favorite_outlined
                          : Icons.favorite_border),
                      onPressed: () {
                        product.toggleFavoriteStaus();
                      },
                      color: Colors.orange,
                    ))),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
              },
              color: Theme.of(context).accentColor,
            ),
          ),
        ));
  }
}
