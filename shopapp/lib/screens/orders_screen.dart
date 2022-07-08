import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/orders.dart' show Order;
import '../widgets/order_item.dart';
import '../widgets/drawer.dart';

class OrdersScreen extends StatefulWidget {
  static String routeName = 'orderScreen';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Order>(context, listen: false).fetchAndSetOrders();
    });
    super.initState();
  }

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
