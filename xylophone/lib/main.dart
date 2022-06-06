import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(String soundNumber) {
    final player = AudioCache();
    player.play(soundNumber);
  }

  Expanded buildKey({required Color color, required String soundNumber}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: Colors.red, soundNumber: 'A.wav'),
              buildKey(color: Colors.orange, soundNumber: 'B.wav'),
              buildKey(color: Colors.yellow, soundNumber: 'C.wav'),
              buildKey(color: Colors.green, soundNumber: 'D.wav'),
              buildKey(color: Colors.teal, soundNumber: 'E.wav'),
              buildKey(color: Colors.blue, soundNumber: 'F.wav'),
              buildKey(color: Colors.purple, soundNumber: 'G.wav'),
            ],
          ),
        ),
      ),
    );
  }
}
