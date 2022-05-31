import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String givenAnswer;
  final VoidCallback selectHandler;
  Answer(this.selectHandler, this.givenAnswer);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(8),
        child: RaisedButton(
          child: Text(givenAnswer),
          color: Colors.blue,
          onPressed: selectHandler,
        ));
  }
}
