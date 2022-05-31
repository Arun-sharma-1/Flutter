import 'package:flutter/material.dart';
import 'ques.dart';
import 'ans.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyApp();
  }
}

class MyApp extends State<App> {
  List questions = [
    {
      'questionText': 'what is your name?',
      'answers': [
        {'text': 'arun', 'score': 10},
        {'text': 'kushal', 'score': 8},
        {'text': 'Aman', 'score': 6},
        {'text': 'Ashwini', 'score': 4}
      ]
    },
    {
      'questionText': 'what is your age?',
      'answers': [
        {'text': 18, 'score': 4},
        {'text': 20, 'score': 10},
        {'text': 21, 'score': 9},
        {'text': 22, 'score': 8}
      ]
    },
    {
      'questionText': 'what is your favorite color?',
      'answers': [
        {'text': 'blue', 'score': 5},
        {'text': 'black', 'score': 10},
        {'text': 'white', 'score': 8},
        {'text': 'pink', 'score': 9}
      ]
    },
  ];

  int _questionIndex = 0;
  int _totalScore = 0;
  void _answerQuestion(int score) {
    setState(() {
      _questionIndex++;
      _totalScore += score;
      // print(_totalScore);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Apps'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['questionText']?.toString() ??
                        ' ',
                  ),

                  //we are mapping questions into widgets
                  //using as List to tell dart that we are converting list into widgets
                  //... is spread operator it is used to add list to list without doing nesting

                  // ...(questions[_questionIndex]['answers'] as List<String>)
                  //     .map<Widget>((answer) {
                  //   return Answer(_answerQuestion, answer);
                  // }).toList(),

                  ...(questions[_questionIndex]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Answer(() => _answerQuestion(answer['score']),
                        answer['text'].toString());
                  }).toList(),

                  // Answer(() => _answerQuestion(questions[_questionIndex]),
                  //     'not null'),
                  // Answer(
                  //     () => _answerQuestion(questions[_questionIndex]['answers']
                  //         [_questionIndex]['text']),
                  //     questions[_questionIndex]['answers'][1].toString()),
                ],
              )
            : Result(_totalScore),
        backgroundColor: Color.fromARGB(255, 20, 248, 248),
      ),
    );
  }
}
