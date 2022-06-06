import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import '../Models/task_data.dart';
// import '../Models/task.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle:
                Provider.of<TaskData>(context).task[index].name.toString(),
            isChecked: Provider.of<TaskData>(context).task[index].isDone,
            checkboxCallBack: (checkboxState) {
              // setState(() {
              //   // task[index].isDone = checkboxState;
              //   widget.tasks[index].toogleDone();
              // });
            });
      },
      itemCount: widget.tasks.length,
    );
  }
}
