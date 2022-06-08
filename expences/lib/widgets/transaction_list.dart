import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final removeTx;

  TransactionList(this.transactions, this.removeTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 470,
        child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: Container(
                  width: 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  child: Text(
                    '₹ ${transactions[index].amount}',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                ),
                title: Text(
                  transactions[index].title.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                    DateFormat('dd-MM-yyyy').format(transactions[index].date)),
                trailing: IconButton(
                  icon: Icon(Icons.delete , color: Colors.red,),
                  onPressed: () => removeTx(transactions[index].id),
                ),
              );
            }),
      ),
    );
  }
}
