import 'package:demo/provider/products.dart';
import 'package:demo/widgets/product_structure.dart';
import './screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/items_overview_screen.dart';
import './provider/products.dart';
import './screens/product_detail_screen.dart';
import './provider/cart_data.dart';
import './provider/orders.dart';
import './screens/orders_screen.dart';
import './screens/user_product_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/auth_screen.dart';
import './provider/auth.dart';

void main() {
  runApp(const MyShop());
}

class MyShop extends StatelessWidget {
  const MyShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
        // ChangeNotifierProvider(create: (_) => Order()),
        ChangeNotifierProxyProvider<Auth, Order>(
          create: (_) => Order('', []),
          update: (ctx, auth, previousOrder) => Order(
              auth.token, previousOrder == null ? [] : previousOrder.orders),
        ),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (ctx) => Products('', []),
          update: (ctx, auth, previousProducts) => Products(auth.token,
              previousProducts!.items == null ? [] : previousProducts.items),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, authData, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Aruns shop',
          theme: ThemeData(
            primaryColor: Colors.pink,
            primarySwatch: Colors.pink,
            accentColor: Colors.orange,
          ),
          home: authData.isAuth ? ItemsOverview() : AuthScreen(),
          routes: {
            ItemsOverview.routeName: (context) => ItemsOverview(),
            ProductDetails.routeName: (context) => const ProductDetails(),
            CartScreen.routeName: (context) => const CartScreen(),
            OrdersScreen.routeName: (context) => OrdersScreen(),
            UserProducts.routeName: (context) => const UserProducts(),
            EditProductScreen.routeName: (context) => const EditProductScreen(),
            AuthScreen.routeName: (context) => AuthScreen(),
          },
        ),
      ),
    );
  }
}
