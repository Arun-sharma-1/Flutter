import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import '../providers/products.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart';
import 'package:provider/provider.dart';
import '../screens/cart_screen.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverview extends StatefulWidget {
  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    // .of<Products>(context) establish a connection between products and productOverview
    final productsData = Provider.of<Products>(
        context); // this will find instance of products if present then okay otherwise move to parent class/Widget

    final products =
        _showOnlyFavorites ? productsData.favItems : productsData.items;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Arun Place '),
          actions: <Widget>[
            PopupMenuButton(
                onSelected: (FilterOptions selectedValue) {
                  setState(() {
                    if (selectedValue == FilterOptions.Favorites) {
                      _showOnlyFavorites = true;
                    } else {
                      _showOnlyFavorites = false;
                    }
                  });
                },
                itemBuilder: (_) => const [
                      PopupMenuItem(
                        child: const Text('Only favorites'),
                        value: FilterOptions.Favorites,
                      ),
                      PopupMenuItem(
                        child: Text('Show All'),
                        value: FilterOptions.All,
                      ),
                    ]),
            Consumer<Cart>(
                builder: (ctx, cart, _) => Badge(
                    child: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                    ),
                    value: cart.itemCount.toString(),
                    color: Colors.cyan))
          ],
        ),
        body: SafeArea(
            child: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15),
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
              // create: (c) => products[index],
              value: products[index],
              child: ProductItem(
                  // id: products[index].id,
                  // title: products[index].title,
                  // imgUrl: products[index].imageUrl),
                  )),
        )));
  }
}
