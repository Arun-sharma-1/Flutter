import 'package:flutter/material.dart';
import 'package:myshop/screens/cart_screen.dart';
import './screens/product_overview.dart';
import './providers/products.dart';
import 'package:provider/provider.dart';
import './screens/product_detail_screen.dart';
import './providers/cart.dart';

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
            create: (_) => Products() // creating instance of Products
            ),
        ChangeNotifierProvider(
            create: (_) => Cart() // creating instance of Products
            ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.orangeAccent,
        ),
        home: ProductOverview(),
        routes: {
          // ProductItem.routeName:(context)=>const ProductItem(id: id, title: title, imgUrl: imgUrl)
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
        },
      ),
    );
  }
}
