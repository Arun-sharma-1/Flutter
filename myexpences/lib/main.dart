import 'package:flutter/material.dart';
import 'models/transation.dart';
import './widgets/new_transaction.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [

  ];


  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Expences')),
        body: Column(
          children: [
            Container(
              child: Card(
                child: Text('CHART'),
                elevation: 3,
              ),
              width: double.infinity,
              height: 200,
            ),
            UserTransaction()
          ],
        ),
      ),
    ));
  }
}
