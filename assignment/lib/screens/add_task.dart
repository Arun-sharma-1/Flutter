import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  final Function addTaskCallBack;
  AddTask(this.addTaskCallBack);

  @override
  Widget build(BuildContext context) {
    String newValue;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Add Task',
            style: TextStyle(
              fontSize: 28,
              fontFamily: 'Pacifico',
              letterSpacing: 3,
              color: Colors.lightBlueAccent,
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Enter Task',
              contentPadding: EdgeInsets.all(10),
            ),
            onChanged: (updatedValue) {
              newValue = updatedValue;
            },
          ),
          FlatButton(
            color: Colors.lightBlueAccent,
            child: Text(
              ' Add ',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              addTaskCallBack(newValue);
            },
          ),
        ],
      ),
    );
  }
}
