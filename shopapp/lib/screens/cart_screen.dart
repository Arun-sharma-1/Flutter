import 'package:flutter/material.dart';
import '../provider/cart_data.dart';
import 'package:provider/provider.dart';
import '../provider/orders.dart';

class CartScreen extends StatelessWidget {
  static String routeName = 'cartScreen';
  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(label: Text('₹ ${cart.totalBill.toString()} ')),
                  const SizedBox(
                    width: 15,
                  ),
                  OrderButton(cart: cart)
                ],
              ),
            ),
          ),
          Expanded(child: cart_item(cart: cart))
        ],
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:( widget.cart.totalAmount <= 0 || _isLoading )
            ? null
            : () async {
                setState(() {
                  _isLoading = true;
                });
                 await Provider.of<Order>(context, listen: false).addOrder(
                    widget.cart.items.values.toList(), widget.cart.totalBill);
                setState(() {
                  _isLoading = false;
                });
                widget.cart.clear();
              },
        child:_isLoading?CircularProgressIndicator(): const Text('Order Now'));
  }
}

class cart_item extends StatelessWidget {
  const cart_item({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Dismissible(
          onDismissed: (direction) {
            cart.removeItem(cart.items.keys.toList()[index]);
          },
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) {
            return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text('Yes')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text('No')),
                ],
                title: Text('Are you sure ?'),
                content: Text('Do you want to delete this item'),
              ),
            );
          },
          key: ValueKey(cart.items.values.toList()[index].id),
          background: Container(
            color: Colors.red,
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            ),
            alignment: Alignment.centerRight,
          ),
          child: Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Text(
                  "₹ ${cart.items.values.toList()[index].price.toString()}",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              title: Text(cart.items.values.toList()[index].title),
              subtitle: Text('₹ ' + cart.totalAmount.toString()),
              trailing: Text('${cart.items.values.toList()[index].quantity} X'),
            ),
          ),
        );
      },
      itemCount: cart.items.length,
    );
  }
}
