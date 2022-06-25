import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/orders.dart' show Order;
import '../widgets/order_item.dart';
import '../widgets/drawer.dart';

class OrdersScreen extends StatelessWidget {
  static String routeName ='orderScreen';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderFile = Provider.of<Order>(context);
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Your Orders '),
      ),
      body: ListView.builder(
          itemCount: orderFile.orders.length,
          itemBuilder: (ctx, index) => OrderItem(orderFile.orders[index])),
    );
  }
}
