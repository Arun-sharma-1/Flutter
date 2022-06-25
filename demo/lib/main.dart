import 'package:demo/provider/products.dart';
import './screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/items_overview_screen.dart';
import './provider/products.dart';
import './screens/product_detail_screen.dart';
import './provider/cart_data.dart';
import './provider/orders.dart';
import './screens/orders_screen.dart';

void main() {
  runApp(const MyShop());
}

class MyShop extends StatelessWidget {
  const MyShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => Order()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aruns shop',
        theme: ThemeData(
          primaryColor: Colors.pink,
          primarySwatch: Colors.pink,
          accentColor: Colors.orange,
        ),
        home: ItemsOverview(),
        routes: {
          ItemsOverview.routeName: (context) => ItemsOverview(),
          ProductDetails.routeName: (context) => const ProductDetails(),
          CartScreen.routeName: (context) => const CartScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen()
        },
      ),
    );
  }
}
