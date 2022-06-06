import 'package:expences/widgets/transaction_list.dart';
import 'package:expences/widgets/user_input.dart';
import 'package:flutter/material.dart';
import '../models/Transaction.dart';

class MainTransaction extends StatefulWidget {
  const MainTransaction({Key? key}) : super(key: key);

  @override
  State<MainTransaction> createState() => _MainTransactionState();
}

class _MainTransactionState extends State<MainTransaction> {
  var newTx;
  final List<Transaction> usertransaction = [
    Transaction(id: 't1', title: 'shoes', amount: 10000, date: DateTime.now()),
    Transaction(id: 't2', title: 'shirt', amount: 500, date: DateTime.now()),
    Transaction(id: 't3', title: 'jeans', amount: 1200, date: DateTime.now()),
  ];

  void addNewTransaction(String title, double amount) {
    newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      usertransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserTransaction(addNewTransaction),
        TransactionList(usertransaction)
      ],
    );
  }
}
