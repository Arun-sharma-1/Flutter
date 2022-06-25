import 'package:flutter/material.dart';

class UserProducts extends StatelessWidget {
  const UserProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Prodcuts'),
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.add))
        ],
      ),
      body: ,

    );
  }
}
