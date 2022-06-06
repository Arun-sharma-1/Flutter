import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  final taskTitle;
  final Function checkBoxCallBack;
  final isChecked;
  TaskTitle({this.taskTitle, this.checkBoxCallBack, this.isChecked});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        onChanged: checkBoxCallBack,
        value: isChecked,
      ),
    );
  }
}
