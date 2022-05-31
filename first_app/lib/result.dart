import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  var totalScore = 0;
  Result(this.totalScore);

  String get resultPhrase {
    var resultText = 'YOU DID IT';
    if (totalScore <= 8) {
      resultText = 'You are awesome and Innocent';
    } else if (totalScore <= 12) {
      resultText = 'Pretty likable';
    } else if (totalScore <= 16) {
      resultText = 'You are .... strange';
    } else {
      resultText = 'You are too bad';
    }
    return resultText + ", Your score is $totalScore";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(resultPhrase,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          )),
    ));
  }
}
