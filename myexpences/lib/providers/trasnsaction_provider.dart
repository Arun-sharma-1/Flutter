import 'package:flutter/material.dart';
import '../models/transation.dart';

class TransactionData with ChangeNotifier {
  final List<Transaction> _usertransaction = [
    Transaction(id: 't1', title: 'shoes', amount: 10000, date: DateTime.now()),
    Transaction(id: 't2', title: 'shirt', amount: 500, date: DateTime.now()),
    Transaction(id: 't3', title: 'jeans', amount: 1200, date: DateTime.now()),
  ];
}
