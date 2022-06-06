import 'package:flutter/material.dart';
import 'task_tile.dart';
import '../modals/task.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;

  TaskList(this.tasks);
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TaskTitle(
                    taskTitle: widget.tasks[index].title,
                    isChecked: widget.tasks[index].isDone,
                    checkBoxCallBack: (bool newState) {
                      setState(() {
                        widget.tasks[index].isDone =
                            !widget.tasks[index].isDone;
                      });
                    });
              },
              itemCount: widget.tasks.length,
            )),
      ),
    );
  }
}
