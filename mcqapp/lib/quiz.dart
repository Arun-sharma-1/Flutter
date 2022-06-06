import 'package:flutter/material.dart';
import 'package:mcqapp/button.dart';
import 'question.dart';
import 'result.dart';


class MyQuiz extends StatefulWidget {
  @override
  State<MyQuiz> createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  int questionIndex = 0;
  int totalScore = 0;

  List<Widget> iconsList = [];
  List<Question> questions = [
    Question(
      ques: 'Q1. Who created Flutter?',
      answers: [
        'Facebook',
        'Adobe',
        'Google',
        'Microsoft',
      ],
      correctAns: 'C',
    ),
    Question(
      ques: 'Q2. What is Flutter?',
      answers: [
        'Android Development Kit',
        'IOS Development Kit',
        'Web Development Kit',
        'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
      ],
      correctAns: 'D',
    ),
    Question(
      ques: ' Q3. Which programing language is used by Flutter',
      answers: [
        'Ruby',
        'Dart',
        'C++',
        'Kotlin',
      ],
      correctAns: 'B',
    ),
    Question(
        ques: 'Q4. Who created Dart programing language?',
        answers: [
          'Lars Bak and Kasper ',
          'Brendan Eich',
          'Bjarne Stroustrup',
          'Jeremy Ashkenas',
        ],
        correctAns: 'A'),
  ];

  void changeQuesHandler() {
    setState(() {
      questionIndex++;
    });
  }

  void resetHandler() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MCQ\'S'),
        ),
        body: questions.length > questionIndex
            ? Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Column(
                  children: [
                    Text(
                      questions[questionIndex].ques,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyButton(
                          //means user choosed option A
                          title: questions[questionIndex].answers[0].toString(),
                          taskHandler: () {
                            setState(() {
                              if ('A' == questions[questionIndex].correctAns)
                                totalScore++;
                              questionIndex++;
                            });
                          },
                        ),
                        MyButton(
                            title:
                                questions[questionIndex].answers[1].toString(),
                            taskHandler: () {
                              setState(() {
                                if ('B' == questions[questionIndex].correctAns)
                                  totalScore++;
                                questionIndex++;
                              });
                            }),
                        MyButton(
                          title: questions[questionIndex].answers[2].toString(),
                          taskHandler: () {
                            setState(() {
                              if ('C' == questions[questionIndex].correctAns)
                                totalScore++;
                              questionIndex++;
                            });
                          },
                        ),
                        MyButton(
                            title:
                                questions[questionIndex].answers[3].toString(),
                            taskHandler: () {
                              setState(() {
                                if ('D' == questions[questionIndex].correctAns)
                                  totalScore++;
                                questionIndex++;
                              });
                            })
                      ],
                    ),
                    Row(
                      children: [],
                    )
                  ],
                ),
              )
            : MyResult(
                handler: resetHandler,
                totalScore: totalScore,
              ),
      ),
    );
  }
}
