import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String title;
  final VoidCallback taskHandler;

  MyButton({ required this.title,required this.taskHandler});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FlatButton(
          child: Text(
            title
          ),
          onPressed:taskHandler,
          color: Colors.green,
        )
      ],
    );
  }
}
