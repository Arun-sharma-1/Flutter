import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final clicks;
  final VoidCallback onPressed;

  MyCard(this.clicks, {required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 40,
        right: 40,
        top: 20,
        bottom: 10,
      ),
      color: Colors.blueGrey,
      child: Column(
        children: [
          Text(clicks.toString()),
          SizedBox(height: 40),
          ElevatedButton(
            child: Icon(Icons.add),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
