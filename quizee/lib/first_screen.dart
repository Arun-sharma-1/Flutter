import 'package:flutter/material.dart';
import 'result.dart';
import 'question.dart';
import 'button.dart';

class MyQuiz extends StatefulWidget {
  const MyQuiz({Key? key}) : super(key: key);

  @override
  State<MyQuiz> createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  List<Widget> iconsScore = [];

  List<Question> quesBank = [
    Question(questionText: 'Jaipur present in rajasthan', questionAns: true),
    Question(
        questionText:
            'you are not  gaining knowledge while making this project',
        questionAns: false),
    Question(
        questionText: 'Your hair are white and black both', questionAns: true),
  ];

  int quesIndex = 0;
  int totalScore = 0;

  void _resetQuiz() {
    setState(() {
      quesIndex = 0;
      totalScore = 0;
      iconsScore.clear();
    });
  }

  void changeQues(bool value) {
    setState(() {
      if (quesBank[quesIndex].questionAns == value) {
        totalScore++;
        iconsScore.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        iconsScore.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      quesIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: quesIndex < quesBank.length
            ? Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 300),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      quesBank[quesIndex].questionText,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.white),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyButton(changeQues),
                        Row(
                          children: iconsScore,
                        )
                      ],
                    ),
                  ],
                ),
              )
            : MyResult(totalScore, _resetQuiz));
  }
}
