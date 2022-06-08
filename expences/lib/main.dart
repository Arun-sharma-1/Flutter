import './widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './widgets/user_input.dart';
import './models/Transaction.dart';
import './widgets/char.dart';

void main() {
  runApp(MyExpences());
}

class MyExpences extends StatefulWidget {
  @override
  State<MyExpences> createState() => _MyExpencesState();
}

class _MyExpencesState extends State<MyExpences> {
  List<Transaction> usertransaction = [
    Transaction(id: 't1', title: 'shoes', amount: 10000, date: DateTime.now()),
    Transaction(id: 't2', title: 'shirt', amount: 500, date: DateTime.now()),
    Transaction(id: 't3', title: 'jeans', amount: 1200, date: DateTime.now()),
  ];

  void addUserTransaction(String title, double amount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      usertransaction.add(newTx);
    });
  }

  void startAddUserTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return UserTransaction(addUserTransaction);
      },
    );
  }

  void deleteTransaction(String id) {
    setState(() {
      usertransaction.removeWhere((element) => element.id == id);
    });
  }

  List<Transaction> get recentTransaction {
    return usertransaction.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expences',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.lightBlue, //for floating action button
      ),
      home: Scaffold(
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) {
                  return UserTransaction(addUserTransaction);
                },
              );
            },
          ),
        ),
        appBar: AppBar(
          title: Text('My Expences'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => startAddUserTransaction(context),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Card(
                  child: Text('CHART'),
                ),

                //userTransaction = TransactionList + TextField
                MyChart(recentTransaction),
                TransactionList(usertransaction, deleteTransaction),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
