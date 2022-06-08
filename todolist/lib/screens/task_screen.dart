import 'package:flutter/material.dart';
import './addtask_screen.dart';
import '../widgets/task_list.dart';

import '../Models/task_data.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  Widget sizedbox() {
    return SizedBox(
      height: 25,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => AddTask((newTaskTitle) {
                    Navigator.pop(context);
                  }));
        },
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.only(top: 80, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 38,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.list,
                  size: 45,
                  color: Colors.lightBlueAccent,
                ),
              ),
              sizedbox(),
              Text(
                'Remaining Task',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 27,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${Provider.of<TaskData>(context).task.length} task ',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
        sizedbox(),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 20),
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: TaskList(),
          ),
        ),
      ]),
    );
  }
}
