import 'package:flutter/material.dart';

class MyResult extends StatelessWidget {
  final VoidCallback handler;
  final totalScore;
  MyResult({required this.handler , required this.totalScore});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('This is the ending of quiz ans your total score is  ${totalScore}'),
          FlatButton(

            onPressed: handler,
            child: Text(
              'Reset Quiz',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2),
            ),
          )
        ],
      ),
    );
  }
}
