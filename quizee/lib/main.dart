import 'package:flutter/material.dart';
import 'first_screen.dart';

void main() {
  runApp(Quizee());
}

class Quizee extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child:MyQuiz(),
    ));
  }
}
