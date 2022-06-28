import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';
import '../widgets/user_product_item.dart';
import '../widgets/drawer.dart';
import '../screens/edit_product_screen.dart';

class UserProducts extends StatelessWidget {
  static String routeName = 'user_productscreen';
  const UserProducts({Key? key}) : super(key: key);

  Future<void> _refreshProduct(BuildContext context) async
  {
    await  Provider.of<Products>(context , listen: false).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: RefreshIndicator(
        onRefresh: ( )=>_refreshProduct(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (_, i) => Column(
              children: [
                UserProductItem(
                  id: productsData.items[i].id,
                  title: productsData.items[i].title,
                  imageUrl: productsData.items[i].imageUrl,
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
