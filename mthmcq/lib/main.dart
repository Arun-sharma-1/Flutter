import 'package:flutter/material.dart';
import './questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var question = [
    Question(
        ques: 'What is 2 +2 ?', answers: ['4', '3', '2', '5'], Rightans: 'A'),
    Question(
        ques: 'What is 2 +3?', answers: ['4', '3', '2', '5'], Rightans: 'D'),
    Question(
        ques: 'What is 2 +4 ?', answers: ['4', '6', '2', '5'], Rightans: 'B'),
  ];
  int questionIndex = 0;
  int currentScore = 0;

  void registerAttempt(String optionId) {
    if (currentScore < question.length) {
      if (question[questionIndex].isCorrect(optionId)) {
        currentScore++;
      }
      questionIndex++;
    }

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light()
            .copyWith(scaffoldBackgroundColor: Colors.orangeAccent),
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SafeArea(
              child: questionIndex < question.length
                  ? Column(
                      children: [
                        Text('$currentScore / ${question.length}'),
                        Expanded(
                          child: Center(
                            child: Text(question[questionIndex].ques,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30)),
                          ),
                        ),
                        Row(
                          children: [
                            CustomButtons(
                              optionId: 'A',
                              option:
                                  question[questionIndex].answers[0].toString(),
                              onPressed: () {
                                setState(() {
                                  registerAttempt('A');
                                });
                              },
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            CustomButtons(
                              optionId: 'B',
                              option:
                                  question[questionIndex].answers[1].toString(),
                              onPressed: () {
                                setState(() {
                                  registerAttempt('B');
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomButtons(
                              optionId: 'C',
                              option:
                                  question[questionIndex].answers[2].toString(),
                              onPressed: () {
                                setState(() {
                                  registerAttempt('C');
                                });
                              },
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            CustomButtons(
                              optionId: 'D',
                              option:
                                  question[questionIndex].answers[3].toString(),
                              onPressed: () {
                                setState(() {
                                  registerAttempt('D');
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    )
                  : Center(child: Text('$currentScore / ${question.length}')),
            ),
          ),
        ));
  }
}

class CustomButtons extends StatelessWidget {
  final String optionId;
  final String option;
  final VoidCallback onPressed;
  CustomButtons(
      {required this.optionId, required this.option, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text('$optionId . $option'),
        style: ElevatedButton.styleFrom(
            primary: Colors.lightBlueAccent,
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
