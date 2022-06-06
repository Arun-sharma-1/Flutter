import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function stateChanger;
  MyButton(this.stateChanger);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: FlatButton(
            onPressed: () {
              //user picked true
              stateChanger(true);
            },
            child: Text('TRUE'),
            color: Colors.lightGreen,
            height: 60,
          ),
        ),
        FlatButton(
          onPressed: () {
            //user choose false
            stateChanger(false);
          },
          child: Text('FALSE'),
          color: Colors.red,
          height: 60,
        )
      ],
    );
  }
}
