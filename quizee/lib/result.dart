import 'package:flutter/material.dart';

class MyResult extends StatelessWidget {
  final VoidCallback reset;
  final totalScore;
  MyResult(this.totalScore, this.reset);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
            child: Column(
          children: [
            Text(
                'This is the ending of quiz and your total score is ${totalScore}'),
            FlatButton(
              child: Text('Restart'),
              onPressed: reset,
            )
          ],
        )),
      ),
    );
  }
}
