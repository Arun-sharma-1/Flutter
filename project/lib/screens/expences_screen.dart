import 'package:flutter/material.dart';
import '../provider/itemList_provider.dart';
import 'package:provider/provider.dart';

class ExpencesScreen extends StatelessWidget {
  final String productId;
  const ExpencesScreen({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productFile = Provider.of<Items>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomListTile(productFile, context, 'baby'),
          CustomListTile(productFile, context, 'beauty'),
          CustomListTile(productFile, context, 'bills'),
          CustomListTile(productFile, context, 'book'),
          CustomListTile(productFile, context, 'car'),
          CustomListTile(productFile, context, 'clothing'),
          CustomListTile(productFile, context, 'education'),
          CustomListTile(productFile, context, 'electronics'),
          CustomListTile(productFile, context, 'ensurance'),
          CustomListTile(productFile, context, 'entertainment'),
          CustomListTile(productFile, context, 'food'),
          CustomListTile(productFile, context, 'fruits'),
          CustomListTile(productFile, context, 'gift'),
          CustomListTile(productFile, context, 'health'),
          CustomListTile(productFile, context, 'home'),
          CustomListTile(productFile, context, 'maintenance'),
          CustomListTile(productFile, context, 'office'),
          CustomListTile(productFile, context, 'others'),
          CustomListTile(productFile, context, 'sports'),
          CustomListTile(productFile, context, 'wine'),
        ],
      ),
    );
  }

  Widget CustomListTile(Items productFile, BuildContext context, String text) {
    return Column(
      children: [
        const Divider(),
        GestureDetector(
          onTap: () {
            productFile.updateImage(productId, Image.asset('assets/$text.png'));
            Navigator.of(context).pop();
          },
          child: ListTile(
            leading: Image(image: AssetImage("assets/$text.png")),
            title: Text(text),
            trailing: const Text('box'),
          ),
        ),
      ],
    );
  }
}
