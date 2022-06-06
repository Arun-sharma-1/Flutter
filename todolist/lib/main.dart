import 'package:flutter/material.dart';
import 'screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'Models/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      builder: (context , child) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
