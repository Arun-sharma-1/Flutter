import 'package:flutter/material.dart';
import '../models/transation.dart';
import '../textStyle.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction>transactions ;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Column(
      children:transactions
          .map((tx) => Card(
          child: Row(
            children: [
              Container(
                child: TextStyles("₹ ${tx.amount}"),
                margin: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.blueAccent,
                        width: 1.5,
                        style: BorderStyle.solid)),
                padding: EdgeInsets.all(7),
                width: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.title.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                  Text(
                    DateFormat('dd - MM - yyyy').format(tx.date),
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              )
            ],
          )))
          .toList(),
    );
  }
}
