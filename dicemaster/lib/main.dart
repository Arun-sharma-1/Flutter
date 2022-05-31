import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return (runApp(DicePage()));
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftdicenumber = 1;
  int rightdicenumber = 2;
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                  child: FlatButton(
                child: Image.asset('images/dice$leftdicenumber.png'),
                onPressed: () {
                  setState(() {
                    leftdicenumber = Random().nextInt(6) + 1;
                    rightdicenumber = Random().nextInt(6) + 1;
                  });
                },
              )),
              Expanded(
                  child: FlatButton(
                      onPressed: () {
                        setState(() {
                          rightdicenumber = Random().nextInt(6) + 1;
                          leftdicenumber = Random().nextInt(6) + 1;

                        });
                      },
                      child: Image.asset('images/dice$rightdicenumber.png'))),
            ],
          ),
        ),
      ),
    ));
  }
}
