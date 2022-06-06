import 'package:flutter/material.dart';
import './widgets/user_input.dart';
import './widgets/main_transaction.dart';

void main() {
  runApp(MyExpences());
}

class MyExpences extends StatefulWidget {

  @override
  State<MyExpences> createState() => _MyExpencesState();
}

class _MyExpencesState extends State<MyExpences> {
  void startAddNewTransaction(BuildContext ctx)
  {
    showBottomSheet(context: ctx, builder: (_) {
      return UserTransaction(addTx);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        appBar: AppBar(
          title: Text('My Expences'),
          backgroundColor: Colors.green,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
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
                MainTransaction(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
