import 'package:flutter/material.dart';
import './transaction_list.dart';
import 'new_transaction.dart ';
import '../models/transation.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _usertransaction = [
    Transaction(id: 't1', title: 'shoes', amount: 10000, date: DateTime.now()),
    Transaction(id: 't2', title: 'shirt', amount: 500, date: DateTime.now()),
    Transaction(id: 't3', title: 'jeans', amount: 1200, date: DateTime.now()),
  ];
  var newTx;

  void addNewTransaction(String title, double amount) {
    newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _usertransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addNewTransaction),
        TransactionList(_usertransaction),
      ],
    );
  }
}
