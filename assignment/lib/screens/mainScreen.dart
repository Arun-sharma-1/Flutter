import 'package:flutter/material.dart';
import 'package:my_card/screens/add_task.dart';
import '../widgets/task_list.dart';
import '../screens/add_task.dart';
import '../modals/task.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Task> tasks = [
    Task(title: 'Buy milk', isDone: false),
    Task(title: 'Buy eggs', isDone: false),
    Task(title: 'Buy bread', isDone: false),
  ];

  void AddItems() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => AddTask((newTaskTitle) {
                          setState(() {
                            tasks.add(Task(title: newTaskTitle, isDone: false));
                          });
                          Navigator.pop(context);
                        }));
              }),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 50,
                    ),
                    radius: 40,
                    backgroundColor: Colors.white,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('${tasks.length} tasks'),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            TaskList(tasks),
          ],
        ),
      ),
    );
  }
}
