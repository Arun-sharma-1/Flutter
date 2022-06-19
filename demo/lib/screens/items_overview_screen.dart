import 'package:flutter/material.dart';
import '../widgets/product_structure.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';
import '../widgets/badgeWidget.dart';
import '../screens/cart_screen.dart';
import '../provider/cart_data.dart';

enum PopUpValues {
  showfavorites,
  showall,
}

class ItemsOverview extends StatefulWidget {
  static String routeName = 'itemOverview';
  @override
  State<ItemsOverview> createState() => _ItemsOverviewState();
}

class _ItemsOverviewState extends State<ItemsOverview> {
  bool _showOnlyFav = false;

  @override
  Widget build(BuildContext context) {
    final productsFile = Provider.of<Products>(context);
    final products = _showOnlyFav ? productsFile.favItems : productsFile.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arun\'s Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (PopUpValues selectedOption) {
              setState(() {
                if (selectedOption == PopUpValues.showfavorites)
                  _showOnlyFav = true;
                else
                  _showOnlyFav = false;
              });
            },
            itemBuilder: (_) {
              return [
                const PopupMenuItem(
                    child: const Text('only Favorites'),
                    value: PopUpValues.showfavorites),
                const PopupMenuItem(
                  child: const Text('Show All'),
                  value: PopUpValues.showall,
                ),
              ];
            },
          ),
          Consumer<Cart>(
            builder: ((context, cart, child) => Badge(
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                ),
                value: (cart.getLength).toString(),
                color: Colors.cyan)),
          )
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
            value: products[index], child: ProductStructure()),
      )),
    );
  }
}
