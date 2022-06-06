import 'package:flutter/material.dart';

// import 'package:flutter/services.dart';

class AddTask extends StatelessWidget {
  final Function addTaskCallBack;
  AddTask(this.addTaskCallBack);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(children: [
          Text(
            'Add Task',
            style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent,
                fontFamily: 'pacifico'),
          ),
          TextField(
            keyboardType: TextInputType.name,
            autofocus: false,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Enter Task',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
            onChanged: (newText) {
              newTaskTitle = newText;
            },
          ),
          FlatButton(
            child: Text('Add'),
            color: Colors.blue,
            onPressed: () {
              addTaskCallBack(newTaskTitle);
            },
          ),
        ]),
      ),
    );
  }
}
