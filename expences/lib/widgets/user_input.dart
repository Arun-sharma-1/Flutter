import 'package:flutter/material.dart';


class UserTransaction extends StatelessWidget {
  var titleController = TextEditingController();
  var amountController = TextEditingController();

  final Function addTx;
  UserTransaction(this.addTx);

  void SubmitData() {
    final entredTitle = titleController.text;
    final entredAmount = double.parse(amountController.text);
    if (entredTitle.isEmpty || entredAmount <= 0) {
      return;
    }
    addTx(entredTitle, entredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Item',
          ),
          controller: titleController,
        ),
        TextField(
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => SubmitData()),
        FlatButton(
          onPressed: SubmitData,
          child: Text('Add Transaction'),
          color: Colors.blue,
        ),
      ],
    );
  }
}
